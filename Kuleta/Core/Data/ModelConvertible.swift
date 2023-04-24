//
//  ModelConvertible.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 24.4.23.
//

import Foundation

/// Protocol to provide functionality for data model conversion.
protocol ModelConvertible {
    associatedtype Model

    /// Converts a conforming instance to a data model instance.
    ///
    /// - Returns: The converted data model instance.
    func toModel() -> Model?
}