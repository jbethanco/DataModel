//
//  ContentView3.swift
//  DataModel
//
//  Created by John Bethancourt on 2/15/21.
//

import SwiftUI

struct EventSplitView: View {
    @ObservedObject var event: Event
    @State var selected: Int?

    var body: some View {
        HStack {
            VStack {
                Form {
                    Section(header: Text("Sorties")) {
                        List {
                            ForEach(event.sorties) { sortie in
                                Button {

                                } label: {
                                    HStack {
                                        Image(systemName: "airplane")
                                        Text(sortie.takeoffICAO)
                                        Text(sortie.landICAO)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .background(Color.gray)
            .cornerRadius(20)
            .padding([.leading, .trailing])
            .padding(.top)
            Spacer()
            detailView.frame(width: 444)
            Spacer()
        }
        .navigationBarTitle(event.name)

    }

    @ViewBuilder var detailView: some View {
        if selected == nil {
            Text("Select An Item")
        } else {
            Text("\(selected!) is selected")
        }
    }

    var highlightColor: some View {
        Color.accentColor
            .opacity(0.8)
            .cornerRadius(10)
            .frame(height: 40)
            .frame(minWidth: 150, maxWidth: 200)
    }
}

struct RoundedSection: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(10)
    }
}
