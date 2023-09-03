//
//  FloatingPanel.swift
//  Notki
//
//  Created by Marek Skrzelowski on 31/08/2023.
//

import SwiftUI

final class FloatingPanel<Content: View>: NSPanel {
    @Binding var isPresented: Bool

    init(
        view: () -> Content,
        contentRect: NSRect,
        backing: NSWindow.BackingStoreType = .buffered,
        defer flag: Bool = false,
        isPresented: Binding<Bool>
    ) {
        self._isPresented = isPresented
        super.init(
            contentRect: contentRect,
            styleMask: [.nonactivatingPanel, .titled, .resizable, .closable, .fullSizeContentView],
            backing: backing,
            defer: flag
        )
        isFloatingPanel = true
        level = .floating
        collectionBehavior.insert(.fullScreenAuxiliary)
        titleVisibility = .hidden
        titlebarAppearsTransparent = true
        isMovableByWindowBackground = true
        hidesOnDeactivate = true
        standardWindowButton(.closeButton)?.isHidden = true
        standardWindowButton(.miniaturizeButton)?.isHidden = true
        standardWindowButton(.zoomButton)?.isHidden = true
        animationBehavior = .utilityWindow
        contentView = NSHostingView(
            rootView: view()
                .ignoresSafeArea()
                .environment(\.addPanel, self)
        )
    }

    override func resignMain() {
        super.resignMain()
        close()
    }

    override func close() {
        super.close()
        isPresented = false
    }

    override var canBecomeKey: Bool { true }

    override var canBecomeMain: Bool { true }
}

private struct AddPanelKey: EnvironmentKey {
    static let defaultValue: NSPanel? = nil
}

extension EnvironmentValues {
    var addPanel: NSPanel? {
        get { self[AddPanelKey.self] }
        set { self[AddPanelKey.self] = newValue }
    }
}
