//
//  CloudKitPersistence.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 1/2/24.
//

import Foundation
import CoreData

struct CloudKitPersistence {
    static let shared = CloudKitPersistence()
    
    // a container that encapsulates the core data stack in the app
    let container: NSPersistentCloudKitContainer
    
    init() {
        // specify the container
        container = NSPersistentCloudKitContainer(name: "Products")
        
        container.loadPersistentStores { (storeDescription: NSPersistentStoreDescription, error: Error?) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
        
        // Since multiple instances of the app could potentially change the same data at the same time, we also need to define a merge policy to make sure that conflicting changes are handled:
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
}
