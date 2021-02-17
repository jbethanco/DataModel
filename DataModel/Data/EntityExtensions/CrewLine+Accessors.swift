//
//  CrewLine+Accessors.swift
//  DataModel
//
//  Created by John Bethancourt on 2/8/21.
////
//

////    @NSManaged public var events: NSSet?
////    @NSManaged public var flightConditions: FlightConditions?
////    @NSManaged public var flightTime: FlightTime?

extension CrewLine {
    public var flightAuthDutyCode: String {
        get { return flightAuthDutyCode_ ?? "" }
        set { flightAuthDutyCode_ = newValue }
    }
    public var flightTime: FlightTime {
        get {
            if flightTime_ == nil {
                let newFlightTime = FlightTime(context: self.managedObjectContext!)
                newFlightTime.crewLine = self
                flightTime_ = newFlightTime
                return flightTime_!
            }
            return flightTime_!
        }
        set { flightTime_ = newValue }
    }
    public var person: Person {
        get {
            if person_ == nil {
                let newPerson = Person(context: self.managedObjectContext!)
                person_ = newPerson
                return person_!
            }
            return person_!
        }
        set { person_ = newValue }
    }
    public var flyingOrganization: String {
        get { return flyingOrganization_ ?? "" }
        set { flyingOrganization_ = newValue }
    }
}
