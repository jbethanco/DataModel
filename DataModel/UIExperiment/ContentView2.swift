//
//  ContentView2.swift
//  DataModel
//
//  Created by John Bethancourt on 2/15/21.
//

import SwiftUI

struct ContentView2: View {

    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Event.entity(),
        sortDescriptors: [],
        animation: .default)
    private var events: FetchedResults<Event>

    @State private var selectedEvent: Event?
    @State private var selectedSortie: Sortie?

    var body: some View {
        NavigationView {

            Sidebar(events: events, selectedEvent: $selectedEvent)
            if let event = selectedEvent {
                EventSplitView(event: event, selected: nil)
            }

        }
    }
}

struct Sidebar: View {
    var events: FetchedResults<Event>
    @Binding var selectedEvent: Event?
    var body: some View {

            List(selection: $selectedEvent) {
                ForEach(events) { event in
                    ZStack(alignment: .leading) {
                        NavigationLink(destination:
                             EventSplitView(event: event)
                        ) {
                            EmptyView()
                        }
                        .opacity(0.0)
                        .buttonStyle(PlainButtonStyle())
                        HStack {
                            Image(systemName: "tray.2")
                            VStack(alignment: .leading) {
                                Text(event.name)
                                    .font(.body)
                                Text(event.summary)
                                    .font(.caption)
                            }
                        }

                    }
                }

        }
    }
}
struct PrimaryView2: View {
    @ObservedObject var event: Event
    var body: some View {

        VStack(alignment: .leading) {
            Text("EVENT")
            Text(event.name)

                List {
                    ForEach(event.sorties) { sortie in
                        Text(sortie.takeoffICAO)
                    }
                }

        }
    }
}
struct PrimaryView: View {

    // List data example
    @ObservedObject var event: Event

    var body: some View {

        GeometryReader { geo in
            NavigationView {
                List(event.sorties, id: \.self) { sortie in
                    NavigationLink(destination: DetailView(sortie: sortie)) {
                        Text(sortie.takeoffICAO)
                    }
                }
                // .navigationBarTitle("Requests")

                Text("Nothing Selected.")
            }
            .padding(.leading, geo.size.height > geo.size.width ? 1 : 0)
        }

    }
}
struct DetailView: View {
    @ObservedObject var sortie: Sortie
    var body: some View {
        Text("Detail")
    }
}
struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
