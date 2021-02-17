//
//  MissionEventRecord+CoreDataProperties.swift
//  DataModel
//
//  Created by John Bethancourt on 2/16/21.
//
//

import Foundation
import CoreData


extension MissionEventRecord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MissionEventRecord> {
        return NSFetchRequest<MissionEventRecord>(entityName: "MissionEventRecord")
    }

    @NSManaged public var asInstructor: Bool
    @NSManaged public var numberAccomplished: Int16
    @NSManaged public var crewLine: CrewLine?
    @NSManaged public var eventType: MissionEventTypes?

}

extension MissionEventRecord : Identifiable {

}
