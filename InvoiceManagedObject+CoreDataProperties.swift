//
//  InvoiceManagedObject+CoreDataProperties.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 24.4.23.
//
//

import CoreData
import Foundation

public extension InvoiceManagedObject {
    @nonobjc class func fetchRequest() -> NSFetchRequest<InvoiceManagedObject> {
        return NSFetchRequest<InvoiceManagedObject>(entityName: "InvoiceManagedObject")
    }

    @NSManaged var id: Int32
    @NSManaged var totalPrice: Double
    @NSManaged var totalPriceWithoutVAT: Double
    @NSManaged var totalVATAmount: Double
    @NSManaged var cashRegister: String?
    @NSManaged var invoiceOrderNumber: Double
    @NSManaged var dateTimeCreated: String?
    @NSManaged var iic: String?
    @NSManaged var tin: String?
    @NSManaged var items: NSSet?
    @NSManaged var sameTaxes: NSSet?
    @NSManaged var paymentMethod: PaymentMethodManagedObject?
    @NSManaged var origin: SellerManagedObject?
}

// MARK: Generated accessors for items

public extension InvoiceManagedObject {
    @objc(addItemsObject:)
    @NSManaged func addToItems(_ value: ItemManagedObject)

    @objc(removeItemsObject:)
    @NSManaged func removeFromItems(_ value: ItemManagedObject)

    @objc(addItems:)
    @NSManaged func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged func removeFromItems(_ values: NSSet)
}

// MARK: Generated accessors for sameTaxes

public extension InvoiceManagedObject {
    @objc(addSameTaxesObject:)
    @NSManaged func addToSameTaxes(_ value: TaxManagedObject)

    @objc(removeSameTaxesObject:)
    @NSManaged func removeFromSameTaxes(_ value: TaxManagedObject)

    @objc(addSameTaxes:)
    @NSManaged func addToSameTaxes(_ values: NSSet)

    @objc(removeSameTaxes:)
    @NSManaged func removeFromSameTaxes(_ values: NSSet)
}

extension InvoiceManagedObject: Identifiable {}
