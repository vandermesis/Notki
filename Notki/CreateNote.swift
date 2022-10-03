//
//  CreateNote.swift
//  Notki
//
//  Created by Marek Skrzelowski on 02/10/2022.
//

import SwiftUI

struct CreateNote: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var noteCount: Int = 60
    
    @ObservedObject var viewModel: CreateNoteViewModel
    
    @FocusState private var isTextFieldFocused: Bool {
        didSet {
            print("focus")
        }
    }

    init(viewModel: CreateNoteViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
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
                    print(viewModel.note)
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
    }
}

struct CreateNote_Previews: PreviewProvider {
    static var previews: some View {
        CreateNote(viewModel: .init())
    }
}
