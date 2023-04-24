//
//  PaymentMethod.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 22.4.23.
//

import Foundation

class PaymentMethod: Codable {
    let id: Int?
    let type: String?
    let amount: Double?
    let typeCode: String?

    enum CodingKeys: String, CodingKey {
        case id
        case type
        case amount
        case typeCode
    }

    init(id: Int?, type: String?, amount: Double?, typeCode: String?) {
        self.id = id
        self.type = type
        self.amount = amount
        self.typeCode = typeCode
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        amount = try container.decodeIfPresent(Double.self, forKey: .amount)
        typeCode = try container.decodeIfPresent(String.self, forKey: .typeCode)
    }
}
