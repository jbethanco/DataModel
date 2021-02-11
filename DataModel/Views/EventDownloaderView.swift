//
//  EventDownloaderView.swift
//  DataModel
//
//  Created by John Bethancourt on 2/9/21.
//

import SwiftUI

struct EventDownloaderView: View {
    
    @Binding var isShown: Bool
    
    var body: some View {
        VStack{
            Text("DOWNLOADING EVENTS")
                .padding()
            Text("This is where you login to P1 SSO.")
                .padding()
            Text("It then downloads your squadrons events JSON.")
                .padding()
            Text("It then decodes those events into a mission\nwith Sorties and People.")
                .padding()
            
            Button {
                 
                let event = try! Event(MockJSON.pbsEvent)
                PBSEventConverter.pblMissionFromEvent(event: event)
                
                print(event)
                isShown = false 
                
            } label: {
                ZStack {
                    Color.gray
                        .frame(width: 500, height: 200)
                        .cornerRadius(10)
                    Text("This is a sample mission\nTap to use it.")
                }
            }
        }
    }
}

struct EventDownloaderView_Previews: PreviewProvider {
    static var previews: some View {
        EventDownloaderView(isShown: .constant(true))
    }
}
