//
//  ContentView.swift
//  Data Model
//
//  Created by John Bethancourt on 2/1/21.
//

import SwiftUI
import CoreData
 
struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Mission.entity(),
        sortDescriptors: [],
        //sortDescriptors: [NSSortDescriptor(keyPath: \Mission.sorties.first?.takeoffTime, ascending: true)],
        animation: .default)
    
    private var missions: FetchedResults<Mission>
    
    @State private var showNewMissionFormModal = false
    @State private var showDownloadEventsModal = false
    
    var body: some View {
        
        NavigationView {
            List{
                ForEach(missions, content: MissionNavigationLink.init)
            }
            .navigationBarTitle("Missions")
            .navigationBarItems(leading: fetchMissionsButton, trailing: addMissionButton)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $showDownloadEventsModal) {
            EventDownloaderView(isShown: $showDownloadEventsModal)
        }
        .pblModal(isPresented: $showNewMissionFormModal){
            AddNewMissionFormView(){
                withAnimation {
                    showNewMissionFormModal = false
                }
            }
        }
    }
    
    var fetchMissionsButton: some View {
        Button{
            withAnimation{
                self.showDownloadEventsModal = true
            }
        } label: {
            Image(systemName: "square.and.arrow.down")
        }
    }

    var addMissionButton: some View {
        Button{
            withAnimation{
                self.showNewMissionFormModal = true
            }
        } label: {
            Image(systemName: "plus")
        }
    }
}

struct MissionNavigationLink: View {
    var mission: Mission
    var body: some View {
        NavigationLink(destination: MissionView(mission: mission)) {
            VStack(alignment:.leading) {
                Text(mission.name)
                    .font(.headline)
                Text(mission.summary)
                    .font(.caption)
                if !mission.allSortiesCalculatedTime.isEmpty{
                    Text("Time: \(mission.allSortiesCalculatedTime)")
                        .font(.caption)
                }
                
            }
        }
    }
}

struct AddNewMissionFormView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var completion: () -> Void
    @State private var missionName = ""
    @State private var missionSummary = ""
    
    var body: some View {
        ZStack{
            Color.black.opacity(1.0)
                VStack{
                    TextField("Mission Name", text: $missionName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Summary", text: $missionSummary)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button {
                        addMission()
                        completion()
                    } label: {
                        Text("Add")
                    }.disabled( missionName.isEmpty || missionSummary.isEmpty )
                }.padding()
             
        }.frame(width:500, height: 200)
        .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.secondary, lineWidth: 2))
        
    }
    func addMission(){
        let mission = Mission(context: viewContext)
        mission.name = missionName
        mission.summary = missionSummary
        try! viewContext.save()
        missionName = ""
        missionSummary = ""
    }
}
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
       let previewController = MockData.preview
        ContentView().environment(\.managedObjectContext, previewController.container.viewContext)
    }
}



