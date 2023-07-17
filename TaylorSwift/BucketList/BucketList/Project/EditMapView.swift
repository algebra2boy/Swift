//
//  EditMapView.swift
//  BucketList
//
//  Created by Yongye Tan on 7/17/23.
//

import SwiftUI

struct EditMapView: View {
    @Environment(\.dismiss) var dismiss
    var location: MapLocation
    var onSave: (MapLocation) -> Void
    
    // these initial values should come from the MapLocation that is being passed in
    // we must use an initializer to help load the state's initial values
    @State private var name: String
    @State private var description: String
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Placename", text: $name)
                    TextField("Placename", text: $description)
                }
            }
            .navigationTitle("Place Details")
            .toolbar {
                Button("Save") {
                    
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description
                    
                    // this modifies the location
                    // whereever the location is passed in and this button is calling from
                    // it will change to a new location in whereever it is called
                    onSave(newLocation)
                    dismiss()
                }
            }
        }
    }
    
    // we have to make a initializer here to extract the values from the MapLocation
    // @escaping means this function will not be called immediately, it will tell swift to keep memory alive
    // stash it away safety to call it later on
    init(location: MapLocation, onSave: @escaping (MapLocation) -> Void) {
        self.location = location
        self.onSave = onSave
        
        // underscope refers to State values
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
}

//#Preview {
//    EditView(location: MapLocation.example) { _ in
//        
//    }
//}
