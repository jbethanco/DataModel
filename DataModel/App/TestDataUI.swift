//
//  TestData.swift
//  DataModel
//
//  Created by John Bethancourt on 2/15/21.
//

import SwiftUI
import CoreData

struct TestDataUI: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dataController: DataController
    @FetchRequest(
        entity: Event.entity(),
        sortDescriptors: []
    )
 
    private var events: FetchedResults<Event>
    
    var body: some View {
        VStack{
            Text("HELLO")
            Text(events.first!.name)
        }
       
    }
}

struct TestDataUI_Previews: PreviewProvider {
     
    static var previews: some View {
        
        let dataController = SampleData.previewDataController
         TestDataUI()
            .environmentObject(dataController)
            .environment(\.managedObjectContext, dataController.container.viewContext)
        
    }
}
