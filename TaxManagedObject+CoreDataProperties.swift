//
//  TaxManagedObject+CoreDataProperties.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 24.4.23.
//
//

import CoreData
import Foundation

public extension TaxManagedObject {
    @nonobjc class func fetchRequest() -> NSFetchRequest<TaxManagedObject> {
        return NSFetchRequest<TaxManagedObject>(entityName: "TaxManagedObject")
    }

    @NSManaged var id: Int32
    @NSManaged var numberOfItems: Double
    @NSManaged var priceBeforeVat: Double
    @NSManaged var vatRate: Double
    @NSManaged var vatAmount: Double
    @NSManaged var origin: InvoiceManagedObject?
}

extension TaxManagedObject: Identifiable {}
