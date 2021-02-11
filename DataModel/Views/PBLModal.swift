//
//  PBLModal.swift
//  DataModel
//
//  Created by John Bethancourt on 2/9/21.
//
import SwiftUI

extension View {
    func pblModal<ModalBody: View>(isPresented: Binding<Bool>, @ViewBuilder modalBody: () -> ModalBody) -> some View {
        CustomModalView( isPresented: isPresented, parent: self, content: modalBody)
    }
}

struct CustomModalView<Parent: View, Content: View>: View {
    
    @Binding var isPresented: Bool
    
    var parent: Parent
    var content: Content
    
    let backgroundRectangle = Rectangle()
    
    var body: some View {
        ZStack {
            parent.blur(radius: isPresented ? 1.0 : 0.0)
            Button {
                withAnimation{
                    self.isPresented = false
                }
            } label: {
                Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.7)
                    .blur(radius: 3.0)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .opacity(isPresented ? 1.0 : 0.0 )
            content.opacity(isPresented ? 1.0 : 0.0 )
        }
    }
    
    init(isPresented: Binding<Bool>, parent: Parent, @ViewBuilder content: () -> Content) {
        self._isPresented = isPresented
        self.parent = parent
        self.content = content()
    }
}

