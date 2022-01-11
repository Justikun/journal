//
//  CareDataStack.swift
//  Journal
//
//  Created by Justin Lowry on 12/20/21.
//

import Foundation
import CoreData

enum CoreDateStack {
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Journal")
        container.loadPersistentStores { NSPersistentStoreDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext { return container.viewContext }
}
