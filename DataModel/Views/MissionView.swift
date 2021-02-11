//
//  MissionView.swift
//  DataModel
//
//  Created by John Bethancourt on 2/9/21.
//

import SwiftUI

struct MissionView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var mission: Mission
    
    var body: some View {
        List{
            ForEach(mission.sorties){ sortie in
                
                NavigationLink("⬆\t\(sortie.takeoffICAO)\t@ \(getDateString(date: sortie.takeoffTime)) \t⬇:\t\(sortie.landICAO) @ \(getDateString(date: sortie.landTime))", destination: SortieView(sortie: sortie))
            }
        }.navigationBarItems(trailing: addSortieButton)
        .navigationBarTitle("\(mission.name): Sorties")
    }
    var addSortieButton: some View {
        Button{
            addSortie()
        } label: {
            Image(systemName: "plus")
        }.disabled(mission.sorties.last?.landTime == nil && mission.sorties.count != 0)
    }
    func getDateString(date: Date?) -> String {
        guard let date = date else { return "" }
        return date.string24HourDateTime()
    }
    func addSortie() {
        
        let newSortie = Sortie(context: viewContext)
        
        if let previousSortie = mission.sorties.last {
            newSortie.takeoffICAO = previousSortie.landICAO
            for crewLine in previousSortie.crewLines{
                let newCrewLine = CrewLine(context: viewContext)
                newCrewLine.flightAuthDutyCode = crewLine.flightAuthDutyCode
                newCrewLine.person = crewLine.person
                newCrewLine.reserveStatus = crewLine.reserveStatus
                newCrewLine.sortie = newSortie
                
                newCrewLine.flightTime = FlightTime(context: viewContext)
            }
        }
        newSortie.mission = mission
        try! viewContext.save()
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        let mission: Mission  = {
            let mission = Mission(context: PersistenceController.shared.container.viewContext)
            mission.name = "tester"
            return mission
        }()
        MissionView(mission: mission )
    }
}
