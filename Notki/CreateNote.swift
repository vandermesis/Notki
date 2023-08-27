//
//  CreateNote.swift
//  Notki
//
//  Created by Marek Skrzelowski on 02/10/2022.
//

import SwiftUI

struct CreateNote: View {
    @State private var noteCount: Int = 60

    @ObservedObject var viewModel: CreateNoteViewModel

    @FocusState private var isTextFieldFocused: Bool {
        didSet {
            print("focus")
        }
    }

    init(viewModel: CreateNoteViewModel) {
        self.viewModel = viewModel
        print("Documents Directory: ", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last ?? "Not Found!")
    }

    var body: some View {
        NavigationView {
            ZStack {
                HStack {
                    TextField(
                        "Enter note and press Return",
                        text: $viewModel.note
                    )
                    .font(.largeTitle)
                    .textFieldStyle(.plain)
                    .padding(.bottom, 15)
                    .focused($isTextFieldFocused)
                    .disableAutocorrection(true)
                    .onSubmit {                        
                        self.isTextFieldFocused = false // Dismiss keyboard
                    }
                    .onChange(of: viewModel.note) { newValue in
                        noteCount = 60 - Int(exactly: newValue.count)!
                    }
                    Text(String(-noteCount))
                        .font(.title2)
                        .foregroundColor(.accentColor)

                }
                .frame(width: 700, height: 55)
                .padding(.horizontal, 25)
            }
#if os(iOS)
            .navigationBarTitle("Create Note")
            .navigationBarItems(trailing: NavigationLink(destination: ContentView(message: viewModel.note)) {
                Text("Save")
            })
#endif
        }
    }
}

#Preview("CreateNote") {
    CreateNote(viewModel: .init())
}
