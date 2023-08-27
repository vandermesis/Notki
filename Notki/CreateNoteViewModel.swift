//
//  CreateNoteViewModel.swift
//  Notki
//
//  Created by Marek Skrzelowski on 02/10/2022.
//

import SwiftUI

final class CreateNoteViewModel: ObservableObject {
    @Published var note: String = ""
}
