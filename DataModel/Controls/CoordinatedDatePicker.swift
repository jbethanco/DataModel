//
//  NilDatePicker.swift
//  DataModel
//
//  Created by John Bethancourt on 2/10/21.
//

import SwiftUI

struct CoordinatedDatePicker: View {
    
    @Binding var date: Date?
    @Binding var pairedDate: Date?
    var isPriorDate: Bool?
    
    private var dateRange: ClosedRange<Date> {
        let farFromNow = Calendar.current.date(byAdding: .day, value: 10000, to: Date())!
        let longAgo = Calendar.current.date(byAdding: .day, value: -10000, to: Date())!
        
        guard let isPriorDate = isPriorDate else {
            return longAgo...farFromNow
        }
        
        if isPriorDate {
            // this is the first date of two paired dates
            guard let pairedDate = pairedDate else {
                //paired date isn't set
                return longAgo...farFromNow
            }
            return longAgo...pairedDate
        }
        
        if !isPriorDate {
            guard let pairedDate = pairedDate else {
                //paired date isn't set
                return longAgo...farFromNow
            }
            return pairedDate...farFromNow
           
        }
            
      return longAgo...farFromNow
        
    }
    
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
                DatePicker("", selection: $controlDate,  in: dateRange, displayedComponents: [.date, .hourAndMinute])
                    .environment(\.locale, .init(identifier: "en_GB"))
            }
        }.frame(width:200, height:40)
       
    }
}
//
//struct NilDatePicker_Previews: PreviewProvider {
//    static var previews: some View {
//        Group{
//            CoordinatedDatePicker( date:.constant(nil), pairedDate:.constant(nil), isPriorDate: true)
//            CoordinatedDatePicker( date:.constant(Date()), pairedDate:.constant(nil), isPriorDate: true)
//        }
//
//    }
//}
