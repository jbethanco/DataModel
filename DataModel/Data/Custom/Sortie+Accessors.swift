//
//  Sortie.swift
//
//  Created by John Bethancourt on 2/4/21.
//

import Foundation

extension Sortie{
    
    public var missionNumber: String {
        get { return missionNumber_ ?? "" }
        set { missionNumber_ = newValue }
    }
    
    public var missionSymbol: String {
        get { return missionSymbol_ ?? "" }
        set { missionSymbol_ = newValue }
    }
    
    public var landICAO: String {
        get { return landICAO_ ?? "" }
        set { landICAO_ = newValue }
    }
    
    public var takeoffICAO: String {
        get { return takeoffICAO_ ?? "" }
        set { takeoffICAO_ = newValue }
    }
    
    public var mds: String {
        get { return mds_ ?? "" }
        set { mds_ = newValue }
    }
    
    public var serialNumber: String {
        get { return serialNumber_ ?? "" }
        set { serialNumber_ = newValue }
    }
    
    public var harmLocation: String {
        get { return harmLocation_ ?? "" }
        set { harmLocation_ = newValue }
    }
    public var unitCharged: String {
        get { return unitCharged_ ?? "" }
        set { unitCharged_ = newValue }
    }
    
    public var crewLines: [CrewLine] {
        get {
            let set = crewLines_ as? Set<CrewLine> ?? []
            return Array(set).sorted()
        }
        set {
            crewLines_ = Set(newValue) as NSSet
        }
    }
    
}
