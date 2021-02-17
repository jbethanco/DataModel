//
//  ContentView.swift
//  DataModel
//
//  Created by John Bethancourt on 2/15/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Top Bar")
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                Text("Shake Device for fake data generation. (Or Command+Ctrl+Z in simulator.)")
                    .font(.caption)
                    .padding(.bottom, 2)
            }
            .background(Color.purple)

            EventsOverview()
        }.modalProvider()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
