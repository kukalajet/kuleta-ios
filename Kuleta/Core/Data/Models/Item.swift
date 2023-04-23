//
//  Item.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 22.4.23.
//

import Foundation

class Item: Codable {
    let id: Int?
    let name: String?
    let code: String?
    let unit: String?
    let quantity: Double?
    let unitPriceBeforeVat: Double?
    let unitPriceAfterVat: Double?
    let priceBeforeVat: Double?
    let vatRate: Double?
    let vatAmount: Double?
    let priceAfterVat: Double?
    let investment: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case code
        case unit
        case quantity
        case unitPriceBeforeVat
        case unitPriceAfterVat
        case priceBeforeVat
        case vatRate
        case vatAmount
        case priceAfterVat
        case investment
    }
    
    init(
        id: Int?,
        name: String?,
        code: String?,
        unit: String?,
        quantity: Double?,
        unitPriceBeforeVat: Double?,
        unitPriceAfterVat: Double?,
        priceBeforeVat: Double?,
        vatRate: Double?,
        vatAmount: Double?,
        priceAfterVat: Double?,
        investment: Bool?
    ) {
        self.id = id
        self.name = name
        self.code = code
        self.unit = unit
        self.quantity = quantity
        self.unitPriceBeforeVat = unitPriceBeforeVat
        self.unitPriceAfterVat = unitPriceAfterVat
        self.priceBeforeVat = priceBeforeVat
        self.vatRate = vatRate
        self.vatAmount = vatAmount
        self.priceAfterVat = priceAfterVat
        self.investment = investment
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        code = try container.decodeIfPresent(String.self, forKey: .code)
        unit = try container.decodeIfPresent(String.self, forKey: .unit)
        quantity = try container.decodeIfPresent(Double.self, forKey: .quantity)
        unitPriceBeforeVat = try container.decodeIfPresent(Double.self, forKey: .unitPriceBeforeVat)
        unitPriceAfterVat = try container.decodeIfPresent(Double.self, forKey: .unitPriceAfterVat)
        priceBeforeVat = try container.decodeIfPresent(Double.self, forKey: .priceBeforeVat)
        vatRate = try container.decodeIfPresent(Double.self, forKey: .vatRate)
        vatAmount = try container.decodeIfPresent(Double.self, forKey: .vatAmount)
        priceAfterVat = try container.decodeIfPresent(Double.self, forKey: .priceAfterVat)
        investment = try container.decodeIfPresent(Bool.self, forKey: .investment)
    }
}
