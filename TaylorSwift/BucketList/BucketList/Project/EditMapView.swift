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
    
    enum LoadingState {
        case loading, loaded, failed
    }
    
    @State private var loadingState: LoadingState = .loading
    @State private var pages = [Page]()
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Placename", text: $name)
                    TextField("Placename", text: $description)
                }
                
                Section {
                    switch loadingState {
                    case .loaded:
                        ForEach(pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                            
                        }
                    case .loading:
                        Text("Loading")
                    case .failed:
                        Text("Please try again later")
                    }
                } header: {
                    Text("Nearby")
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
            .task {
                await fetchNearbyPlaces()
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
    
    func fetchNearbyPlaces() async {
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.coordinate.latitude)%7C\(location.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
        
        // double check the url
        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
            // sorting alphabetically
            pages = items.query.pages.values.sorted()
            print(pages)
            loadingState = .loaded
            print("I have loaded")
            
        } catch {
            loadingState = .failed
        }
        
    }
}

#Preview {
    EditMapView(location: MapLocation.example) { _ in
        
    }
}
