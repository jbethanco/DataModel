//
//  ModalProvider.swift
//
//  Created by John Bethancourt on 2/12/21.
//

import SwiftUI

class ModalProvider: ObservableObject {

    @Published var modalIsVisible = false

    public var modalView: AnyView!

    static let shared = ModalProvider()

    func showView(_ view: AnyView) {
        self.modalView = view
    }
}

struct ModalViewModifier: ViewModifier {

    @ObservedObject var modalProvider = ModalProvider.shared

    func body(content: Content) -> some View {
          content
            .pblModal(isPresented: $modalProvider.modalIsVisible) {
                modalProvider.modalView
            }

      }

}
extension View {
    /// A view modifier extension for convenience usage of the AlertViewModifier
    ///
    /// Usage as follows:
    ///
    ///     ContentView()
    ///     .modalProvider()
    ///
    func modalProvider() -> some View {
        self.modifier(ModalViewModifier())
    }
}
