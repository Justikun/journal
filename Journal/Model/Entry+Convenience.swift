//
//  Entry+Convenience.swift
//  Journal
//
//  Created by Justin Lowry on 12/20/21.
//

import Foundation
import CoreData

extension Entry {
    convenience init(title: String, body: String, timeStamp: Date = Date(), context: NSManagedObjectContext = CoreDateStack.context) {
        
        
        self.init(context: context)
        
        self.title = title
        self.body = body
        self.timestamp = timestamp
    }
}
