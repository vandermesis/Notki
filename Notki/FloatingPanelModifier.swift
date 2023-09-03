//
//  FloatingPanelModifier.swift
//  Notki
//
//  Created by Marek Skrzelowski on 31/08/2023.
//

import SwiftUI

fileprivate struct FloatingPanelModifier<PanelContent: View>: ViewModifier {
    @State var panel: FloatingPanel<PanelContent>?
    @Binding var isPresented: Bool
    @ViewBuilder let view: () -> PanelContent
    var contentRect: CGRect = CGRect(x: 0, y: 0, width: 624, height: 512)

    func body(content: Content) -> some View {
        content
            .onAppear {
                panel = FloatingPanel(view: view, contentRect: contentRect, isPresented: $isPresented)
                panel?.center()
                if isPresented { present() }
            }
            .onDisappear {
                panel?.close()
                panel = nil
            }
            .onChange(of: isPresented) { value in
                value ? present() : panel?.close()
            }
    }

    func present() {
        panel?.orderFront(nil)
        panel?.makeKey()
    }
}

extension View {
    func floatingPanel<Content: View>(
        isPresented: Binding<Bool>,
        contentRect: CGRect = CGRect(x: 0, y: 0, width: 624, height: 512),
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self.modifier(FloatingPanelModifier(isPresented: isPresented, view: content, contentRect: contentRect))
    }
}
