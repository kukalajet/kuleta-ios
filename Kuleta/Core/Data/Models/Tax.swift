//
//  Tax.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 22.4.23.
//

import Foundation

class Tax: Codable {
    let id: Int?
    let numberOfItems: Double?
    let priceBeforeVat: Double?
    let vatRate: Double?
    let vatAmount: Double?

    enum CodingKeys: String, CodingKey {
        case id
        case numberOfItems
        case priceBeforeVat
        case vatRate
        case vatAmount
    }

    init(
        id: Int?,
        numberOfItems: Double?,
        priceBeforeVat: Double?,
        vatRate: Double?,
        vatAmount: Double?
    ) {
        self.id = id
        self.numberOfItems = numberOfItems
        self.priceBeforeVat = priceBeforeVat
        self.vatRate = vatRate
        self.vatAmount = vatAmount
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        numberOfItems = try container.decodeIfPresent(Double.self, forKey: .numberOfItems)
        priceBeforeVat = try container.decodeIfPresent(Double.self, forKey: .priceBeforeVat)
        vatRate = try container.decodeIfPresent(Double.self, forKey: .vatRate)
        vatAmount = try container.decodeIfPresent(Double.self, forKey: .vatAmount)
    }
}
