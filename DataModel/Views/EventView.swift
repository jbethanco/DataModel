//
//  EventView.swift
//  DataModel
//
//  Created by John Bethancourt on 2/9/21.
//

import SwiftUI

struct EventView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dataController: DataController
    
    @ObservedObject var event: Event
    
    var body: some View {
        List{
            ForEach(event.sorties){ sortie in
              
                NavigationLink("⬆\t\(sortie.takeoffICAO)\t@ \(getDateString(date: sortie.takeoffTime)) \t⬇:\t\(sortie.landICAO) @ \(getDateString(date: sortie.landTime))", destination: SortieView(sortie: sortie))
            }
            .onDelete(perform: deleteSelectedSorties)
        }
        .toolbar{
            EditButton()
            addSortieButton
        }
        .navigationBarTitle("\(event.name): Sorties")
    }
    
    func deleteSelectedSorties(offsets: IndexSet) {
        for offset in offsets{
            let itemToDelete = event.sorties[offset]
            dataController.delete(itemToDelete)
            dataController.save()
        }
    }
    
    var addSortieButton: some View {
        Button{
            addSortie()
        } label: {
            Image(systemName: "plus")
        }.disabled(event.sorties.last?.landTime == nil && event.sorties.count != 0)
    }
    
    func getDateString(date: Date?) -> String {
        guard let date = date else { return "" }
        return date.string24HourDateTime()
    }
    func addSortie() {
        
        let newSortie = Sortie(context: viewContext)
        
        if let previousSortie = event.sorties.last {
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
        newSortie.event = event
        try! viewContext.save()
    }
}

struct EventView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let dataController = SampleData.previewDataController
        EventView(event: SampleData.event)
            .environmentObject(dataController)
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}
