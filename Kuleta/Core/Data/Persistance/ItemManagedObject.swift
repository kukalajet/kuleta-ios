//
//  ItemManagedObject.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 23.4.23.
//

import CoreData
import Foundation

// MARK: - CoreData Managed Object

@objc(ItemManagedObject)
class ItemManagedObject: NSManagedObject {
    @NSManaged var code: String?
    @NSManaged var id: Int32
    @NSManaged var investment: Bool
    @NSManaged var name: String?
    @NSManaged var priceAfterVat: Double
    @NSManaged var priceBeforeVat: Double
    @NSManaged var quantity: Double
    @NSManaged var unit: String?
    @NSManaged var unitPriceAfterVat: Double
    @NSManaged var unitPriceBeforeVat: Double
    @NSManaged var vatAmount: Double
    @NSManaged var vatRate: Double
    @NSManaged var origin: InvoiceManagedObject?
}

extension ItemManagedObject: ModelConvertible {
    /// The managed entity name.
    static var entityName = "Item"

    /// The entity default sort descriptors.
    static var sortDescriptors: [NSSortDescriptor]? { return nil }

    /// The default sorted fetch request.
    static var sortedFetchRequest: NSFetchRequest<ItemManagedObject> {
        let request: NSFetchRequest<ItemManagedObject> = fetchRequest()
        request.sortDescriptors = ItemManagedObject.sortDescriptors
        return request
    }

    /// Returns the default fetch request (default descriptors and sorting).
    ///
    /// - Returns: The default fetch request.
    static func fetchRequest() -> NSFetchRequest<ItemManagedObject> {
        return NSFetchRequest<ItemManagedObject>(entityName: entityName)
    }

    // MARK: - ModelConvertible

    /// Converts a ItemManagedObject instance to a Item instance.
    ///
    /// - Returns: The converted Item instance.
    func toModel() -> Item? {
        return Item(
            id: Int(id),
            name: name,
            code: code,
            unit: unit,
            quantity: quantity,
            unitPriceBeforeVat: unitPriceBeforeVat,
            unitPriceAfterVat: unitPriceAfterVat,
            priceBeforeVat: priceBeforeVat,
            vatRate: vatRate,
            vatAmount: vatAmount,
            priceAfterVat: priceAfterVat,
            investment: investment
        )
    }
}
