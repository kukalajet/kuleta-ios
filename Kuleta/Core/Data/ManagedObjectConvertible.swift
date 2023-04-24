//
//  ManagedObjectConvertible.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 24.4.23.
//

import CoreData

/// Protocol to provide functionality for Core Data managed object conversion.
protocol ManagedObjectConvertible {
    associatedtype ManagedObject

    /// Converts a conforming instance to a managed object instance.
    ///
    /// - Parameter context: The managed object context to use.
    /// - Returns: The converted managed object instance.
    func toManagedObject(in context: NSManagedObjectContext) -> ManagedObject?
}
