//
//  SortieTotalTimeTest.swift
//  DataModelTests
//
//  Created by John Bethancourt on 2/9/21.
//

import XCTest
@testable import DataModel

class SortieTests: XCTestCase {
 
    func testSortieTotalTime() throws {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm - d MMM y"
        
        let date1 = formatter.date(from: "20:00 - 30 Oct 2019")
        var date2 = formatter.date(from: "20:04 - 30 Oct 2019")
        var time = Sortie.timeBetweenDatesFor781(start: date1!, end: date2!)
        XCTAssertEqual(time == 0.1, true)
        
        date2 = formatter.date(from: "20:10 - 30 Oct 2019")
        time = Sortie.timeBetweenDatesFor781(start: date1!, end: date2!)
        XCTAssertEqual(time == 0.2, true)
        
        date2 = formatter.date(from: "20:16 - 30 Oct 2019")
        time = Sortie.timeBetweenDatesFor781(start: date1!, end: date2!)
        XCTAssertEqual(time == 0.3, true)
        
        date2 = formatter.date(from: "21:16 - 30 Oct 2019")
        time = Sortie.timeBetweenDatesFor781(start: date1!, end: date2!)
        XCTAssertEqual(time == 1.3, true)
        
        date2 = formatter.date(from: "22:26 - 30 Oct 2019")
        time = Sortie.timeBetweenDatesFor781(start: date1!, end: date2!)
        XCTAssertEqual(time == 2.4, true)
        
        date2 = formatter.date(from: "22:26 - 31 Oct 2019")
        time = Sortie.timeBetweenDatesFor781(start: date1!, end: date2!)
        XCTAssertEqual(time == 26.4, true)
        
        date2 = formatter.date(from: "22:49 - 31 Oct 2019")
        time = Sortie.timeBetweenDatesFor781(start: date1!, end: date2!)
        XCTAssertEqual(time == 26.8, true)
    }

    

}
