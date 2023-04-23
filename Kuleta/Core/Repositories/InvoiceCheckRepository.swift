//
//  InvoiceCheckRepository.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 22.4.23.
//

import Foundation

protocol InvoiceCheckRepositable {
    func verifyInvoice(
        iic: String,
        dateTimeCreated: String,
        tin: String
    ) async -> Result<Invoice, RequestError>
}

struct InvoiceCheckRepository: InvoiceCheckRepositable {
    static let shared = InvoiceCheckRepository()
    
    func verifyInvoice(
        iic: String,
        dateTimeCreated: String,
        tin: String
    ) async -> Result<Invoice, RequestError> {
        return await InvoiceCheckService.shared.verifyInvoice(
            iic: iic,
            dateTimeCreated: dateTimeCreated,
            tin: tin
        )
    }
}
