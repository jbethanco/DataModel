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

    func testTenthsOfAnHour() {
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 0), 0.0)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 1), 0.0)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 2), 0.0)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 3), 0.1)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 8), 0.1)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 9), 0.2)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 14), 0.2)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 15), 0.3)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 20), 0.3)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 21), 0.4)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 26), 0.4)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 27), 0.5)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 33), 0.5)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 34), 0.6)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 39), 0.6)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 40), 0.7)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 45), 0.7)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 46), 0.8)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 51), 0.8)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 52), 0.9)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 57), 0.9)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 58), 1.0)
        XCTAssertEqual(Sortie.tenthsOfAnHour(fromMinutes: 59), 1.0)
    }

}
