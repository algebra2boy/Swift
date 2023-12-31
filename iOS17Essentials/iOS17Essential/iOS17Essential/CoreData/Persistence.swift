//
//  Persistence.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 12/30/23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    // a container that encapsulates the core data stack in the app
    let container: NSPersistentContainer
    
    init() {
        // specify the container
        container = NSPersistentContainer(name: "Products")
        
        container.loadPersistentStores { (storeDescription: NSPersistentStoreDescription, error: Error?) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
    }
    
}
