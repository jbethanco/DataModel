//
//  Date+Ext.swift
//  DataModel
//
//  Created by John Bethancourt on 2/9/21.
//

import Foundation

extension Date {
    func string24HourDateTime() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm - d MMM y"
        return(dateFormatter.string(from:self))
    }
}
