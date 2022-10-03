//
//  NotkiApp.swift
//  Notki
//
//  Created by Marek Skrzelowski on 24/09/2022.
//

import SwiftUI

@main
struct NotkiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            CreateNote(viewModel: .init())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .windowStyle(.hiddenTitleBar)
    }
}
