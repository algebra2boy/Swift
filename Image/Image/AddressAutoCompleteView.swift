//
//  AddressAutoCompleteView.swift
//  Image
//
//  Created by Yongye Tan on 11/10/23.
//

import SwiftUI
import MapKit

struct AddressAutoCompleteView: View {
    
    @State private var searchText = ""
    @State private var places: [MKMapItem] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search", text: $searchText)
                    .padding()
                    .onChange(of: searchText) {
                        searchForPlaces()
                    }
                
                List(places, id: \.self) { place in
                    Text(place.name ?? "")
                }
            }
            .navigationTitle("Search")
        }
        
        
    }
    
    func searchForPlaces() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        let search = MKLocalSearch(request: request)
        
        search.start { response, _ in
            if let response = response {
                self.places = response.mapItems
            }
        }
    }
}

#Preview {
    AddressAutoCompleteView()
}
