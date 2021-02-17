//
//  ContentView.swift
//  Data Model
//
//  Created by John Bethancourt on 2/1/21.
//

import SwiftUI
import CoreData

struct EventsOverview: View {

    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dataController: DataController

    @FetchRequest(
        entity: Event.entity(),
        sortDescriptors: [],
        animation: .default)

    private var events: FetchedResults<Event>

    @State private var editMode = EditMode.inactive

    @State private var showNewMissionFormModal = false
    @State private var showDownloadEventsModal = false

    var body: some View {

            NavigationView {
                List {
                    Text("\(events.count)")
                    ForEach(events, content: MissionNavigationLink.init)
                        .onDelete(perform: deleteSelectedEvents)
                }.toolbar {
                    EditButton()
                    addMissionButton
                  }
                .navigationBarTitle("Missions")
                .environment(\.editMode, $editMode)
            }
            .navigationViewStyle(StackNavigationViewStyle())

            .sheet(isPresented: $showDownloadEventsModal) {
                EventDownloaderView(isShown: $showDownloadEventsModal)
            }
            .pblModal(isPresented: $showNewMissionFormModal) {

                AddNewMissionFormView {
                    withAnimation {
                        showNewMissionFormModal = false
                    }
                }
            }
    }

    func deleteSelectedEvents(offsets: IndexSet) {
        for offset in offsets {
            let itemToDelete = events[offset]
            dataController.delete(itemToDelete)
            dataController.save()
        }
    }

    var fetchMissionsButton: some View {
        Button {
            withAnimation {
                self.showDownloadEventsModal = true
            }
        } label: {
            Image(systemName: "square.and.arrow.down")
        }
    }

     var addMissionButton: some View {
        Button {
            withAnimation {
                self.showNewMissionFormModal = true

            }
        } label: {
            Image(systemName: "plus")
        }
    }
}

struct MissionNavigationLink: View {
    var event: Event
    var body: some View {
        NavigationLink(destination: EventView(event: event)) {
            VStack(alignment: .leading) {
                Text(event.name)
                    .font(.headline)
                Text(event.summary)
                    .font(.caption)
                if !event.allSortiesCalculatedTime.isEmpty {
                    Text("Time: \(event.allSortiesCalculatedTime)")
                        .font(.caption)
                }

            }
        }
    }
}

struct AddNewMissionFormView: View {

    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dataController: DataController

    var completion: () -> Void
    @State private var eventName = ""
    @State private var eventSummary = ""

    var body: some View {
        ZStack {
            Color.black.opacity(1.0)
                VStack {
                    TextField("Event Name", text: $eventName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Summary", text: $eventSummary)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button {
                        addEvent()
                        completion()
                    } label: {
                        Text("Add")
                    }.disabled( eventName.isEmpty || eventSummary.isEmpty )
                }.padding()

        }
        .frame(width: 500, height: 200)
        .overlay(RoundedRectangle(cornerRadius: 10)
        .stroke(Color.secondary, lineWidth: 2))

    }
    func addEvent() {

        let event = Event(context: viewContext)
        event.name = eventName
        event.summary = eventSummary
        dataController.save()

        eventName = ""
        eventSummary = ""

    }
}
struct EventsOverview_Previews: PreviewProvider {

    static var previews: some View {

        let dataController = SampleData.previewDataController

        EventsOverview()
            .environmentObject(dataController)
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }

}
