//
//  NewNoteView.swift
//  Notki
//
//  Created by Marek Skrzelowski on 30/08/2023.
//

import SwiftUI

@available(macOS 14.0, *)
struct NewNoteView: View {
    @State private var input: String = ""

    var body: some View {
        VStack(spacing: 20) {
            TextField("Szukaj...", text: $input)
                .font(.title)
                .padding()
                .background(Color(.systemFill))
                .cornerRadius(10)
                .shadow(radius: 5)

            List {
                // Przykładowe pozycje do wyświetlenia:
                Text("Pozycja 1")
                Text("Pozycja 2")
                Text("Pozycja 3")
            }
        }
        .padding()
    }
}
