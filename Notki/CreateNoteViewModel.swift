//
//  CreateNoteViewModel.swift
//  Notki
//
//  Created by Marek Skrzelowski on 02/10/2022.
//

import SwiftUI

final class CreateNoteViewModel: ObservableObject {
    @Published var note: Note?
}

struct Note: Identifiable {
    let id: UUID
    let title: String
    let description: String
}

struct Mock {}
extension Mock {
    static let note1 = Note(id: UUID(), title: "Pierwsza notatka", description: "Jakieś detale")
    static let note2 = Note(id: UUID(), title: "Druga notatka", description: "Jakieś inne detale")
    static let notes = [note1, note2]
}
