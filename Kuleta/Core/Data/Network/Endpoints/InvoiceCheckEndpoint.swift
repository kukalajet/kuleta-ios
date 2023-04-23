//
//  InvoiceCheckEndpoint.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 22.4.23.
//

import Foundation

enum InvoiceCheckEndpoint {
    case verifyInvoice(
        iic: String,
        dateTimeCreated: String,
        tin: String
    )
}

extension InvoiceCheckEndpoint: Endpoint {
    var path: String {
        switch self {
        case .verifyInvoice:
            return "/invoice-check/api/verifyInvoice"
        }
    }

    var method: RequestMethod {
        switch self {
        case .verifyInvoice:
            return .post
        }
    }

    var header: [String: String]? {
        switch self {
        case .verifyInvoice:
            return [
                "Content-Type": "application/x-www-form-urlencoded"
            ]
        }
    }

    var body: [String: String]? {
        switch self {
        case let .verifyInvoice(iic, dateTimeCreated, tin):
            return [
                "iic": iic,
                "dateTimeCreated": dateTimeCreated,
                "tin": tin,
            ]
        }
    }
}
