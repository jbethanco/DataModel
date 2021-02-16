//
//  PBSEventConverter.swift
//  DataModel
//
//  Created by John Bethancourt on 2/10/21.
//

import Foundation
import CoreData

struct PBSEventConverter {
    static func pblEventFromPBSEvent(pbsEvent: PBSEvent, context: NSManagedObjectContext) {
        
        let event = Event(context: context)
        event.name = pbsEvent.name
        
        let sortie = Sortie(context: context)
        sortie.event = event
        sortie.takeoffTime = pbsEvent.startTime
        sortie.landTime = pbsEvent.endTime
         
        for role in pbsEvent.roleAssignments {
           let personID = role.personID
            // TODO: network call to query for the person
            if let personJson = MockJSON.pbsPersons[personID] {
                let pbsPerson = try! PBSPerson(personJson)
                print(pbsPerson)
                
                let crewLine = CrewLine(context: context)
                let person = Person(context: context)
                person.id = UUID(uuidString: personID)
                person.firstName = pbsPerson.firstName
                person.lastName = pbsPerson.lastName
                person.rank = Int16(pbsPerson.rankID)
                
               
                if role.jobRole.roleType.count >= 2{
                    let first = "EFIMOSUXZ" //valid aircrew qualification codes
                    let second = "LPCB" //loadmasters, pilots, copilots, and boom operators
                    let arr = Array(role.jobRole.roleType)
                    // check if their role is valid for our application by checking the first two characters
                    if first.contains(arr[0]) && second.contains(arr[1]) {
                        crewLine.flightAuthDutyCode = role.jobRole.roleType
                    }
                }
                 
                crewLine.person = person
                crewLine.sortie = sortie
                 
            }
             
        }
        
        if !event.sorties.isEmpty {
           try! context.save()
        }
    }
}
