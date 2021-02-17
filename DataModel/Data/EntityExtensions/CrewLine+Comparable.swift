//
//  CrewLine+Comparable.swift
//  DataModel
//
//  Created by John Bethancourt on 2/9/21.
//

extension CrewLine: Comparable {

    public static func < (lhs: CrewLine, rhs: CrewLine) -> Bool {

        if lhs.flightAuthDutyCode == rhs.flightAuthDutyCode {
            // same duty codes compare last names
            if lhs.person.lastName != rhs.person.lastName {
                return lhs.person.lastName < rhs.person.lastName
            }
            // same duty codes and same last name
            if lhs.person.firstName != rhs.person.firstName {
                return lhs.person.firstName < rhs.person.firstName
            }
            // same duty codes, same last name, same first name
            return lhs.person.last4 < rhs.person.last4
        }

        guard lhs.flightAuthDutyCode.count >= 2 else { return false }
        guard rhs.flightAuthDutyCode.count >= 2 else { return true  }

        let lhsCharacters = Array(lhs.flightAuthDutyCode)
        let rhsCharacters = Array(rhs.flightAuthDutyCode)

        let lhsDutyPos = lhsCharacters[1]
        let rhsDutyPos = rhsCharacters[1]

        if lhsDutyPos == rhsDutyPos {
            // They are both pilots "P" or both loadmasters "L" or both the same whatever else
            let lhsEIM = String(lhsCharacters[0])
            let rhsEIM = String(rhsCharacters[0])

            // Priority is 'E'valuator, 'I'nstructor, and 'M'ission
            // thus alphabetical
            let priorities = ["E": 0, "I": 1, "M": 2, "F": 3, "U": 4, "S": 5, "O": 6, "X": 7, "Z": 8]
            guard let lPriorty = priorities[lhsEIM] else { return false }
            guard let rPriorty = priorities[rhsEIM] else { return true }
            return lPriorty < rPriorty
        }

        // they are not the same duty position
        if lhsDutyPos == "P" { return true } // pilots trump all
        if rhsDutyPos == "P" { return false }

        if lhsDutyPos == "L" { return true } // loadmasters next
        if rhsDutyPos == "L" { return false }

        // Then whoever else
        return lhsDutyPos <= rhsDutyPos

    }
}

// var knownCodes = ["XK", "IP B", "MP A", "IPB", "FPLC", "IL B", "XT", "EP", "IP", "MP", "FPQ", "FPC", "FPN", "UP", "EL", "IL", "ML", "FL", "UL", "ML1", "ML2", "ML1C", "ML1B"]
