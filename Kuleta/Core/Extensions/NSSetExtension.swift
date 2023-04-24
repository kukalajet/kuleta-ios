//
//  NSSetExtension.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 23.4.23.
//

import Foundation

extension NSSet {
    func toArray<T>() -> [T] {
        let array = map { $0 as! T }
        return array
    }
}
