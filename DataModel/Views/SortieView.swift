//
//  SortieView.swift
//  DataModel
//
//  Created by John Bethancourt on 2/9/21.
//

import SwiftUI

struct SortieView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var sortie: Sortie
     
    var body: some View {
        VStack{
            HStack {
                TextField("MDS", text: $sortie.mds)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.leading,.trailing])
                TextField("Serial", text: $sortie.serialNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.leading,.trailing])

            }
            HStack{
                TextField("HARM Location", text: $sortie.harmLocation)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.leading,.trailing])

                TextField("Unit Charged", text: $sortie.unitCharged)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.leading,.trailing])

            }
            HStack{
                
                TextField("Takeoff ICAO", text: $sortie.takeoffICAO)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading)
  
                NilDatePicker(date: $sortie.takeoffTime)
                
                TextField("Landing ICAO", text: $sortie.landICAO)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                NilDatePicker(date: $sortie.landTime)
                
                Text("Total: \(sortie.flightTimeString)")
                    .padding(.trailing)
            }
            List{
                ForEach(sortie.crewLines){ crewLine in
                    NavigationLink(destination: CrewLineView(crewLine: crewLine)) {
                        HStack{
                            Text(crewLine.flightAuthDutyCode)
                                .frame(width: 100)
                            VStack(alignment:.leading) {
                                Text("\(crewLine.person.firstName)")
                                Text("\(crewLine.person.lastName)")
                            }
                        }
                    }
                }
            }
            NavigationLink(destination: SplitTimeView(sortie:sortie)) {
                Text("Do the time splitting")
            }
        }
        .navigationBarTitle("\(sortie.takeoffICAO) to \(sortie.landICAO)")
        .onDisappear(){
            try! viewContext.save()
        }
   
     }
}

//struct SortieView_Previews: PreviewProvider {
//    static var previews: some View {
//        //SortieView()
//    }
//}
