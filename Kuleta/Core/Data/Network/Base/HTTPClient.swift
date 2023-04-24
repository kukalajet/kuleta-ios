//
//  HTTPClient.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 22.4.23.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async -> Result<T, RequestError>
}

extension HTTPClient {
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async -> Result<T, RequestError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path

        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header

        if let body = endpoint.body {
            let httpBody = getHttpBody(body: body, header: endpoint.header)
            request.httpBody = httpBody
        }

        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }

            switch response.statusCode {
            case 200 ... 299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodedResponse)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }

    func getHttpBody(
        body: [String: String] = [:],
        header: [String: String]?
    ) -> Data? {
        guard let contentType = header?["Content-Type"] else {
            let httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
            return httpBody
        }

        switch contentType {
        case "application/x-www-form-urlencoded":
            let parsedValue = body.reduce("") { "\($0)\($1.0)=\($1.1)&" }.dropLast()
            let httpBody = parsedValue.data(using: .utf8, allowLossyConversion: false)
            return httpBody
        default:
            let httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
            return httpBody
        }
    }
}
