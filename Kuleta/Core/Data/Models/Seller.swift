//
//  Seller.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 22.4.23.
//

import Foundation

struct Seller: Codable {
    let id: Int?
    let idType: String?
    let idNum: String?
    let name: String?
    let address: String?
    let country: String?

    enum CodingKeys: String, CodingKey {
        case id
        case idType
        case idNum
        case name
        case address
        case country
    }
}
