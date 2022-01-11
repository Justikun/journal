//
//  EntryController.swift
//  Journal
//
//  Created by Justin Lowry on 12/13/21.
//

import Foundation
import CoreData

class EntryController {
    static let shared = EntryController()
    // Properties
    var entries: [Entry] {
        let request: NSFetchRequest<Entry> = Entry.fetchRequest()
        do {
            return try CoreDateStack.context.fetch(request)
        } catch {
            print("Error fetching entries \(error)")
            return []
        }
    }

    // Create
    func add(entry: Entry) {
        saveToPersistentStorage()
    }

    // Delete
    func deleteEntry(entry: Entry) {
        // Managed Object Context
        if let moc = entry.managedObjectContext {
            moc.delete(entry)
        }
        saveToPersistentStorage()
    }

    func saveToPersistentStorage() {
        do {
            try CoreDateStack.context.save()
        } catch let e {
            print("Error Encoding")
            print(e)
            print(e.localizedDescription)
        }
    }
}
