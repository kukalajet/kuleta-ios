//
//  SellerManagedObject.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 23.4.23.
//

import CoreData
import Foundation

// MARK: - CoreData Managed Object

@objc(SellerManagedObject)
class SellerManagedObject: NSManagedObject {
    @NSManaged var address: String?
    @NSManaged var country: String?
    @NSManaged var id: Int32
    @NSManaged var idNum: String?
    @NSManaged var idType: String?
    @NSManaged var name: String?
}

extension SellerManagedObject: ModelConvertible {
    /// The managed entity name.
    static var entityName = "Seller"

    /// The entity default sort descriptors.
    static var sortDescriptors: [NSSortDescriptor]? { return nil }

    /// The default sorted fetch request.
    static var sortedFetchRequest: NSFetchRequest<SellerManagedObject> {
        let request: NSFetchRequest<SellerManagedObject> = fetchRequest()
        request.sortDescriptors = SellerManagedObject.sortDescriptors
        return request
    }

    /// Returns the default fetch request (default descriptors and sorting).
    ///
    /// - Returns: The default fetch request.
    static func fetchRequest() -> NSFetchRequest<SellerManagedObject> {
        return NSFetchRequest<SellerManagedObject>(entityName: entityName)
    }

    // MARK: - ModelConvertible

    /// Converts a TaxManagedObject instance to a Tax instance.
    ///
    /// - Returns: The converted Tax instance.
    func toModel() -> Seller? {
        return Seller(
            id: Int(id),
            idType: idType,
            idNum: idNum,
            name: name,
            address: address,
            country: country
        )
    }
}
