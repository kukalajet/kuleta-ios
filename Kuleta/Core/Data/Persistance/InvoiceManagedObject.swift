//
//  InvoiceManagedObject.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 23.4.23.
//

import CoreData
import Foundation

// MARK: - CoreData Managed Object

@objc(InvoiceManagedObject)
class InvoiceManagedObject: NSManagedObject {
    @NSManaged var cashRegister: String?
    @NSManaged var dateTimeCreated: Date?
    @NSManaged var id: Int32
    @NSManaged var iic: String?
    @NSManaged var invoiceOrderNumber: Double
    @NSManaged var tin: String?
    @NSManaged var totalPrice: Double
    @NSManaged var totalPriceWithoutVAT: Double
    @NSManaged var totalVATAmount: Double
    @NSManaged var items: NSSet?
    @NSManaged var paymentMethod: NSSet?
    @NSManaged var sameTaxes: NSSet?
    @NSManaged var seller: SellerManagedObject?
}

extension InvoiceManagedObject: ModelConvertible {
    /// The managed entity name.
    static var entityName = "Invoice"

    /// The entity default sort descriptors.
    static var sortDescriptors: [NSSortDescriptor]? { return nil }

    /// The default sorted fetch request.
    static var sortedFetchRequest: NSFetchRequest<InvoiceManagedObject> {
        let request: NSFetchRequest<InvoiceManagedObject> = fetchRequest()
        request.sortDescriptors = InvoiceManagedObject.sortDescriptors
        return request
    }

    /// Returns the default fetch request (default descriptors and sorting).
    ///
    /// - Returns: The default fetch request.
    static func fetchRequest() -> NSFetchRequest<InvoiceManagedObject> {
        return NSFetchRequest<InvoiceManagedObject>(entityName: entityName)
    }

    // MARK: - ModelConvertible

    /// Converts a InvoiceManagedObject instance to a Invoice instance.
    ///
    /// - Returns: The converted Invoice instance.
    func toModel() -> Invoice? {
        return Invoice(
            id: Int(id),
            totalPrice: totalPrice,
            totalPriceWithoutVAT: totalPriceWithoutVAT,
            totalVATAmount: totalVATAmount,
            cashRegister: cashRegister,
            invoiceOrderNumber: invoiceOrderNumber,
            dateTimeCreated: dateTimeCreated?.description,
            iic: iic,
            tin: tin,
            seller: seller?.toModel(),
            paymentMethod: paymentMethod?.allObjects as? [PaymentMethod],
            items: items?.allObjects as? [Item],
            sameTaxes: sameTaxes?.allObjects as? [Tax]
        )
    }
}

// MARK: Generated accessors for items

extension InvoiceManagedObject {
    @objc(addItemsObject:)
    @NSManaged func addToItems(_ value: ItemManagedObject)

    @objc(removeItemsObject:)
    @NSManaged func removeFromItems(_ value: ItemManagedObject)

    @objc(addItems:)
    @NSManaged func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged func removeFromItems(_ values: NSSet)
}

// MARK: Generated accessors for paymentMethod

extension InvoiceManagedObject {
    @objc(addPaymentMethodObject:)
    @NSManaged func addToPaymentMethod(_ value: PaymentMethodManagedObject)

    @objc(removePaymentMethodObject:)
    @NSManaged func removeFromPaymentMethod(_ value: PaymentMethodManagedObject)

    @objc(addPaymentMethod:)
    @NSManaged func addToPaymentMethod(_ values: NSSet)

    @objc(removePaymentMethod:)
    @NSManaged func removeFromPaymentMethod(_ values: NSSet)
}

// MARK: Generated accessors for sameTaxes

extension InvoiceManagedObject {
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
