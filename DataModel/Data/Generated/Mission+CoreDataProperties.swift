//
//  Mission+CoreDataProperties.swift
//  DataModel
//
//  Created by John Bethancourt on 2/8/21.
//
//

import Foundation
import CoreData


extension Mission {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mission> {
        return NSFetchRequest<Mission>(entityName: "Mission")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name_: String?
    @NSManaged public var summary_: String?
    @NSManaged public var sorties_: NSSet?

}

// MARK: Generated accessors for sorties_
extension Mission {

    @objc(addSorties_Object:)
    @NSManaged public func addToSorties_(_ value: Sortie)

    @objc(removeSorties_Object:)
    @NSManaged public func removeFromSorties_(_ value: Sortie)

    @objc(addSorties_:)
    @NSManaged public func addToSorties_(_ values: NSSet)

    @objc(removeSorties_:)
    @NSManaged public func removeFromSorties_(_ values: NSSet)

}

extension Mission : Identifiable {

}
