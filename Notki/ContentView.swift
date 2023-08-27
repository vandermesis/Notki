//
//  ContentView.swift
//  Notki
//
//  Created by Marek Skrzelowski on 24/09/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Note.date, ascending: true)],
        animation: .default
    )

    private var notes: FetchedResults<Note>

    let message: String

    init(message: String) {
        self.message = message
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(notes) { note in
                    NavigationLink {
                        Text("Item at \(note.date!, formatter: itemFormatter)")
                    } label: {
                        Text(note.date!, formatter: itemFormatter)
                        Text(note.content ?? "notin")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add note", systemImage: "plus")
                    }
                }
            }
            Text("Select a note")
        }
        .onAppear(perform: addItem)
    }

    private func addItem() {
        withAnimation {
            let newItem = Note(context: viewContext)
            newItem.id = UUID()
            newItem.date = Date()
            newItem.content = message

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { notes[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(message: "halo")
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
