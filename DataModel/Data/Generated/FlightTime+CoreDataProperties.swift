//
//  FlightTime+CoreDataProperties.swift
//  DataModel
//
//  Created by John Bethancourt on 2/8/21.
//
//

import Foundation
import CoreData


extension FlightTime {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FlightTime> {
        return NSFetchRequest<FlightTime>(entityName: "FlightTime")
    }

    @NSManaged public var evaluator: Float
    @NSManaged public var instructor: Float
    @NSManaged public var other: Float
    @NSManaged public var primary: Float
    @NSManaged public var secondary: Float
    @NSManaged public var totalTime: Float
    @NSManaged public var crewLine: CrewLine?

}

extension FlightTime : Identifiable {

}
