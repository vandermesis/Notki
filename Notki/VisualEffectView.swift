//
//  VisualEffectView.swift
//  Notki
//
//  Created by Marek Skrzelowski on 03/09/2023.
//

import SwiftUI

struct VisualEffectView: NSViewRepresentable {
    var material: NSVisualEffectView.Material
    var blendingMode: NSVisualEffectView.BlendingMode
    var state: NSVisualEffectView.State
    var emphasied: Bool

    func makeNSView(context: Context) -> NSVisualEffectView {
        context.coordinator.visualEffectView
    }

    func updateNSView(_ view: NSVisualEffectView, context: Context) {
        context.coordinator.update(
            material: material,
            blendingMode: blendingMode,
            state: state,
            emphasied: emphasied
        )
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator {
        let visualEffectView = NSVisualEffectView()

        init() {
            visualEffectView.blendingMode = .withinWindow
        }

        func update(
            material: NSVisualEffectView.Material,
            blendingMode: NSVisualEffectView.BlendingMode,
            state: NSVisualEffectView.State,
            emphasied: Bool
        ) {
            visualEffectView.material = material
        }
    }
}
