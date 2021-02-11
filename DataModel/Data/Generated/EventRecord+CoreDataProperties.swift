//
//  EventRecord+CoreDataProperties.swift
//  DataModel
//
//  Created by John Bethancourt on 2/8/21.
//
//

import Foundation
import CoreData


extension EventRecord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventRecord> {
        return NSFetchRequest<EventRecord>(entityName: "EventRecord")
    }

    @NSManaged public var asInstructor: Bool
    @NSManaged public var numberAccomplished: Int16
    @NSManaged public var crewLine: CrewLine?
    @NSManaged public var eventType: MissionEventTypes?

}

extension EventRecord : Identifiable {

}
