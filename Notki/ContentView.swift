//
//  ContentView.swift
//  Notki
//
//  Created by Marek Skrzelowski on 24/09/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {

    private var notes: [Note] = Mock.notes

    var body: some View {
        NavigationView {
            List {
                ForEach(notes) { note in
                    NavigationLink {
                        Text(note.description)
                    } label: {
                        Text(note.title)
                    }
                }
            }
        }
    }
}

#Preview("iOS") {
    ContentView()
        .previewDevice(PreviewDevice(rawValue: "iOS"))
}

#Preview("macOS") {
    ContentView()
        .previewDevice(PreviewDevice(rawValue: "macOS"))
}
