//
//  DataController.swift
//  CoreDataProject
//
//  Created by Yongye Tan on 7/5/23.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data filed to load \(error.localizedDescription)")
            }
            
        }
    }
}
