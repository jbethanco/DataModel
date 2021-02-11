//
//  Sortie+Calculations.swift
//  TimeSplit3
//
//  Created by John Bethancourt on 2/7/21.
//

import Foundation

extension Sortie{
    
    var calculatedTotalFlightTimeFor781: Double? {
       
        guard let start = takeoffTime   else { return nil }
        guard let end = landTime        else { return nil }
        guard  end > start              else { return nil }
        
        return Sortie.timeBetweenDatesFor781(start: start, end: end)
    
    }
    
    var flightTimeString: String {
        guard let time = self.calculatedTotalFlightTimeFor781 else { return "" }
        let string = String(format: "%.1f", time)
        return string
    }
    
    static func timeBetweenDatesFor781(start: Date, end: Date) -> Double {
        let interval = end.timeIntervalSince(start)
        let seconds = Int(interval)
        let hours = seconds / 3600
        let minutes = seconds % 3600 / 60
        
        let tenths = tenthsOfAnHour(from:minutes)
        
        return Double(Double(hours) + tenths)
    }
    
    static func tenthsOfAnHour(from minutes: Int) -> Double {
        switch minutes {
        case 0...2:     return 0.0
        case 3...8:     return 0.1
        case 9...14:    return 0.2
        case 15...20:   return 0.3
        case 21...26:   return 0.4
        case 27...33:   return 0.5
        case 34...39:   return 0.6
        case 40...45:   return 0.7
        case 46...51:   return 0.8
        case 52...57:   return 0.9
        default:
                        return 1.0
        }
    }
}
