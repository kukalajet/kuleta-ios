//
//  SellerManagedObject+CoreDataProperties.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 24.4.23.
//
//

import CoreData
import Foundation

public extension SellerManagedObject {
    @nonobjc class func fetchRequest() -> NSFetchRequest<SellerManagedObject> {
        return NSFetchRequest<SellerManagedObject>(entityName: "SellerManagedObject")
    }

    @NSManaged var id: Int32
    @NSManaged var idType: String?
    @NSManaged var idNum: String?
    @NSManaged var name: String?
    @NSManaged var address: String?
    @NSManaged var country: String?
    @NSManaged var invoices: NSSet?
}

// MARK: Generated accessors for invoices

public extension SellerManagedObject {
    @objc(addInvoicesObject:)
    @NSManaged func addToInvoices(_ value: InvoiceManagedObject)

    @objc(removeInvoicesObject:)
    @NSManaged func removeFromInvoices(_ value: InvoiceManagedObject)

    @objc(addInvoices:)
    @NSManaged func addToInvoices(_ values: NSSet)

    @objc(removeInvoices:)
    @NSManaged func removeFromInvoices(_ values: NSSet)
}

extension SellerManagedObject: Identifiable {}
