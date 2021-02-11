//
//  CrewLineView.swift
//  DataModel
//
//  Created by John Bethancourt on 2/9/21.
//

import SwiftUI

struct CrewLineView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @ObservedObject var crewLine: CrewLine
    
    var body: some View {
        VStack{
            Text(crewLine.flightAuthDutyCode + ": " + crewLine.person.firstName + " " + crewLine.person.lastName)
        }
    }
}

//struct CrewLineView_Previews: PreviewProvider {
//    static var previews: some View {
//        CrewLineView()
//    }
//}
