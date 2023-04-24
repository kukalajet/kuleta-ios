//
//  PaymentMethodManagedObject+CoreDataProperties.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 24.4.23.
//
//

import CoreData
import Foundation

public extension PaymentMethodManagedObject {
    @nonobjc class func fetchRequest() -> NSFetchRequest<PaymentMethodManagedObject> {
        return NSFetchRequest<PaymentMethodManagedObject>(entityName: "PaymentMethodManagedObject")
    }

    @NSManaged var id: Int32
    @NSManaged var type: String?
    @NSManaged var amount: Double
    @NSManaged var typeCode: String?
    @NSManaged var origin: InvoiceManagedObject?
}

extension PaymentMethodManagedObject: Identifiable {}
