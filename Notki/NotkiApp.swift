//
//  NotkiApp.swift
//  Notki
//
//  Created by Marek Skrzelowski on 24/09/2022.
//

import SwiftUI

@available(macOS 14.0, *)
@main
struct NotkiApp: App {
    let persistenceController = PersistenceController.shared

    // TODO: Sth to do
    var body: some Scene {
        WindowGroup {
            NewNoteView()
//            CreateNote(viewModel: .init())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        #if os(macOS)
        .windowStyle(.hiddenTitleBar)
        #endif
    }
}
