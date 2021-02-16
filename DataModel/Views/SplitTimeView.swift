//
//  SplitTimeView.swift
//  DataModel
//
//  Created by John Bethancourt on 2/10/21.
//

import SwiftUI

struct SplitTimeView: View {
    
    @ObservedObject var sortie: Sortie
    
    var body: some View {
        List{
            ForEach(sortie.crewLines){ crewLine in
                HStack{
                     Text(crewLine.flightAuthDutyCode)
                    Text(crewLine.person.lastName)
                    Text("\(crewLine.flightTime.instructor)")
                }
                 
            }
        }.navigationBarTitle("Split Time")
    }
}

struct SplitTimeView_Previews: PreviewProvider {
    static var previews: some View {
        let sortie = SampleData.sortie
        SplitTimeView(sortie: sortie)
    }
}
