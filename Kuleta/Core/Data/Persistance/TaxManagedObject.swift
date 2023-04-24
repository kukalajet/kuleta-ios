//
//  TaxManagedObject.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 23.4.23.
//

import CoreData
import Foundation

// MARK: - CoreData Managed Object

@objc(TaxManagedObject)
class TaxManagedObject: NSManagedObject {
    @NSManaged public var id: Int32
    @NSManaged public var numberOfItems: Double
    @NSManaged public var priceBeforeVat: Double
    @NSManaged public var vatAmount: Double
    @NSManaged public var vatRate: Double
    @NSManaged public var origin: InvoiceManagedObject?
}

extension TaxManagedObject: ModelConvertible {
    /// The managed entity name.
    static var entityName = "Tax"

    /// The entity default sort descriptors.
    static var sortDescriptors: [NSSortDescriptor]? { return nil }

    /// The default sorted fetch request.
    static var sortedFetchRequest: NSFetchRequest<TaxManagedObject> {
        let request: NSFetchRequest<TaxManagedObject> = fetchRequest()
        request.sortDescriptors = TaxManagedObject.sortDescriptors
        return request
    }

    /// Returns the default fetch request (default descriptors and sorting).
    ///
    /// - Returns: The default fetch request.
    static func fetchRequest() -> NSFetchRequest<TaxManagedObject> {
        return NSFetchRequest<TaxManagedObject>(entityName: entityName)
    }

    // MARK: - ModelConvertible

    /// Converts a TaxManagedObject instance to a Tax instance.
    ///
    /// - Returns: The converted Tax instance.
    func toModel() -> Tax? {
        return Tax(
            id: Int(id),
            numberOfItems: numberOfItems,
            priceBeforeVat: priceBeforeVat,
            vatRate: vatRate,
            vatAmount: vatAmount
        )
    }
}
