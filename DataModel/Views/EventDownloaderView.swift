//
//  EventDownloaderView.swift
//  DataModel
//
//  Created by John Bethancourt on 2/9/21.
//

import SwiftUI

struct EventDownloaderView: View {

    @Binding var isShown: Bool
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dataController: DataController

    var body: some View {
        VStack {
            Text("DOWNLOADING EVENTS")
                .padding()
            Text("This is where you login to P1 SSO.")
                .padding()
            Text("It then downloads your squadrons events JSON.")
                .padding()
            Text("It then decodes those PBS Events into PBLEvents\nwith Sorties and People.")
                .padding()

            Button {

                let pbsEvent = try! PBSEvent(SampleJSON.pbsEvent)
                PBSEventConverter.pblEventFromPBSEvent(pbsEvent: pbsEvent, context: viewContext)
                dataController.save()
                print(pbsEvent)
                isShown = false

            } label: {
                ZStack {
                    Color.gray
                        .frame(width: 500, height: 200)
                        .cornerRadius(10)
                    Text("This is a sample event\nTap to use it.")
                }
            }
        }
    }
}

struct EventDownloaderView_Previews: PreviewProvider {
    static var previews: some View {
        let dataController = SampleData.previewDataController
        EventDownloaderView(isShown: .constant(true))
            .environmentObject(dataController)
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}
