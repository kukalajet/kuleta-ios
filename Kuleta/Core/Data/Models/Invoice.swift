//
//  Invoice.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 22.4.23.
//

import Foundation

class Invoice: Codable {
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

    init(
        id: Int?,
        totalPrice: Double?,
        totalPriceWithoutVAT: Double?,
        totalVATAmount: Double?,
        cashRegister: String?,
        invoiceOrderNumber: Double?,
        dateTimeCreated: String?,
        iic: String?,
        tin: String?,
        seller: Seller?,
        paymentMethod: [PaymentMethod]?,
        items: [Item]?,
        sameTaxes: [Tax]?
    ) {
        self.id = id
        self.totalPrice = totalPrice
        self.totalPriceWithoutVAT = totalPriceWithoutVAT
        self.totalVATAmount = totalVATAmount
        self.cashRegister = cashRegister
        self.invoiceOrderNumber = invoiceOrderNumber
        self.dateTimeCreated = dateTimeCreated
        self.iic = iic
        self.tin = tin
        self.seller = seller
        self.paymentMethod = paymentMethod
        self.items = items
        self.sameTaxes = sameTaxes
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        totalPrice = try container.decodeIfPresent(Double.self, forKey: .totalPrice)
        totalPriceWithoutVAT = try container.decodeIfPresent(Double.self, forKey: .totalPriceWithoutVAT)
        totalVATAmount = try container.decodeIfPresent(Double.self, forKey: .totalVATAmount)
        cashRegister = try container.decodeIfPresent(String.self, forKey: .cashRegister)
        invoiceOrderNumber = try container.decodeIfPresent(Double.self, forKey: .invoiceOrderNumber)
        dateTimeCreated = try container.decodeIfPresent(String.self, forKey: .dateTimeCreated)
        iic = try container.decodeIfPresent(String.self, forKey: .iic)
        tin = try container.decodeIfPresent(String.self, forKey: .tin)
        seller = try container.decodeIfPresent(Seller.self, forKey: .seller)
        paymentMethod = try container.decodeIfPresent([PaymentMethod].self, forKey: .paymentMethod)
        items = try container.decodeIfPresent([Item].self, forKey: .items)
        sameTaxes = try container.decodeIfPresent([Tax].self, forKey: .sameTaxes)
    }
}
