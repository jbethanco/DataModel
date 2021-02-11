//
//  Person+Accessors.swift
//  TimeSplit3
//
//  Created by John Bethancourt on 2/7/21.
//

import Foundation

extension Person {
    public func copy() -> Person {
        let person = Person(context: self.managedObjectContext!)
        person.lastName = self.lastName
        person.firstName = self.firstName
        person.last4 = self.last4
        return person
    }
    public var lastName: String {
        get { return lastName_ ?? "" }
        set { lastName_ = newValue }
    }
    
    public var firstName: String {
        get { return firstName_ ?? "" }
        set { firstName_ = newValue }
    }
    
    public var last4: String {
        get { return last4_ ?? "" }
        set { last4_ = newValue }
    }
    
    public var organization: String {
        get { return organization_ ?? "" }
        set { organization_ = newValue }
    }
 
}
