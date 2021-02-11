//
//  CrewLineComparable.swift
//  DataModelTests
//
//  Created by John Bethancourt on 2/9/21.
//

import XCTest
@testable import DataModel

class CrewLineTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testComparable() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
       let context =  PersistenceController.shared.container.viewContext
        
        let leftWins = [("EP", "IP"), ("IP", "MP"), ("MP", "EL"), ("MP", "MP")]
        
        for pair in leftWins{
            let lhs = CrewLine(context: context)
            let rhs = CrewLine(context: context)
            let lperson = Person(context: context)
            let rperson = Person(context: context)
            lhs.person = lperson
            rhs.person = rperson
            lhs.person.firstName = "Alpha"
            lhs.person.lastName = "Alpha"
            rhs.person.firstName = "Alpha"
            rhs.person.lastName = "Zulu"
            
            print(rhs.person.lastName)
            
            lhs.flightAuthDutyCode = pair.0
            rhs.flightAuthDutyCode = pair.1
            NSLog ( lhs.flightAuthDutyCode + " - " + rhs.flightAuthDutyCode)
            
            XCTAssertTrue(lhs <= rhs)
        }
    }

  

}
