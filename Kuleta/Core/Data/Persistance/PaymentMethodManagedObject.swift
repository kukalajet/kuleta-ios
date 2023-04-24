//
//  PaymentMethodManagedObject.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 23.4.23.
//

import CoreData
import Foundation

// MARK: - CoreData Managed Object

@objc(PaymentMethodManagedObject)
class PaymentMethodManagedObject: NSManagedObject {
    @NSManaged var amount: Double
    @NSManaged var id: Int32
    @NSManaged var type: String?
    @NSManaged var typeCode: String?
}

extension PaymentMethodManagedObject: ModelConvertible {
    /// The managed entity name.
    static var entityName = "PaymentMethod"

    /// The entity default sort descriptors.
    static var sortDescriptors: [NSSortDescriptor]? { return nil }

    /// The default sorted fetch request.
    static var sortedFetchRequest: NSFetchRequest<PaymentMethodManagedObject> {
        let request: NSFetchRequest<PaymentMethodManagedObject> = fetchRequest()
        request.sortDescriptors = PaymentMethodManagedObject.sortDescriptors
        return request
    }

    /// Returns the default fetch request (default descriptors and sorting).
    ///
    /// - Returns: The default fetch request.
    static func fetchRequest() -> NSFetchRequest<PaymentMethodManagedObject> {
        return NSFetchRequest<PaymentMethodManagedObject>(entityName: entityName)
    }

    // MARK: - ModelConvertible

    /// Converts a PaymentMethodManagedObject instance to a PaymentMethod instance.
    ///
    /// - Returns: The converted PaymentMethod instance.
    func toModel() -> PaymentMethod? {
        return PaymentMethod(
            id: Int(id),
            type: type,
            amount: amount,
            typeCode: typeCode
        )
    }
}
