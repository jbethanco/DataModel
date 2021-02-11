//
//  NilDatePicker.swift
//  DataModel
//
//  Created by John Bethancourt on 2/10/21.
//

import SwiftUI

struct NilDatePicker: View {
    
    @Binding var date: Date?
 
    @State private var controlDate: Date = Date()
 
    var body: some View {
        ZStack(alignment: .center){
           
            if date == nil {
                Button{
                    controlDate = Date()
                    date = controlDate
                } label: {
                    Text("Not Set")
                }
            }else{
                DatePicker("", selection: $controlDate, displayedComponents: [.date, .hourAndMinute])
                    .environment(\.locale, .init(identifier: "en_GB"))
            }
        }.frame(width:200, height:40)
       
    }
}

struct NilDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NilDatePicker(date:.constant(nil))
            NilDatePicker(date:.constant(Date()))
        }

    }
}
