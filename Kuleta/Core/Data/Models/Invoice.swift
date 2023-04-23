//
//  Invoice.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 22.4.23.
//

import Foundation

struct Invoice: Codable {
    let id: Int?
    let totalPrice: Double?
    let totalPriceWithoutVAT: Double?
    let totalVATAmount: Double?
    let cashRegister: String?
    let invoiceOrderNumber: Double?
    let dateTimeCreated: String?
    let iic: String?
    let tin: String?
    let seller: Seller?
    let paymentMethod: [PaymentMethod]?
    let items: [Item]?
    let sameTaxes: [Tax]?

    enum CodingKeys: String, CodingKey {
        case id
        case totalPrice
        case totalPriceWithoutVAT
        case totalVATAmount
        case cashRegister
        case invoiceOrderNumber
        case dateTimeCreated
        case iic
        case tin
        case seller
        case paymentMethod
        case items
        case sameTaxes
    }
}
