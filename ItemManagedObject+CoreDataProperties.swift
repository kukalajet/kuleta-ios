//
//  ItemManagedObject+CoreDataProperties.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 24.4.23.
//
//

import CoreData
import Foundation

public extension ItemManagedObject {
    @nonobjc class func fetchRequest() -> NSFetchRequest<ItemManagedObject> {
        return NSFetchRequest<ItemManagedObject>(entityName: "ItemManagedObject")
    }

    @NSManaged var id: Int32
    @NSManaged var name: String?
    @NSManaged var code: String?
    @NSManaged var unit: String?
    @NSManaged var quantity: Double
    @NSManaged var unitPriceBeforeVat: Double
    @NSManaged var unitPriceAfterVat: Double
    @NSManaged var priceBeforeVat: Double
    @NSManaged var vatRate: Double
    @NSManaged var vatAmount: Double
    @NSManaged var priceAfterVat: Double
    @NSManaged var investment: Bool
    @NSManaged var origin: InvoiceManagedObject?
}

extension ItemManagedObject: Identifiable {}
