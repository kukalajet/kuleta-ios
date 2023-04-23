//
//  InvoiceCheckService.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 22.4.23.
//

import Foundation

protocol InvoiceCheckServiceable {
    func verifyInvoice(
        iic: String,
        dateTimeCreated: String,
        tin: String
    ) async -> Result<Invoice, RequestError>
}

struct InvoiceCheckService: HTTPClient, InvoiceCheckServiceable {
    static let shared = InvoiceCheckService()

    func verifyInvoice(
        iic: String,
        dateTimeCreated: String,
        tin: String
    ) async -> Result<Invoice, RequestError> {
        return await sendRequest(
            endpoint: InvoiceCheckEndpoint.verifyInvoice(
                iic: iic,
                dateTimeCreated: dateTimeCreated,
                tin: tin
            ),
            responseModel: Invoice.self
        )
    }
}
