//
//  NewNoteView.swift
//  Notki
//
//  Created by Marek Skrzelowski on 30/08/2023.
//

import SwiftUI

struct NewNoteView: View {
    @State var showingPanel = false
    
    var body: some View {
        Button("Present panel") {
            showingPanel.toggle()
        }
        .floatingPanel(isPresented: $showingPanel) {
            ZStack {
                Rectangle()
                    .fill(.white)
                Text("I'm floating panel. Click anywhere to dismiss me.")
                    .font(.title)
                    .foregroundStyle(.blue)
            }
        }
    }
}
