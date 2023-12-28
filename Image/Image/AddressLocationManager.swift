//
//  AddressLocationManager.swift
//  Image
//
//  Created by Yongye Tan on 11/10/23.
//

import SwiftUI
import MapKit

struct AddressLocationManager: View {
    @State private var address = ""
    @State private var latitude = 0.0
    @State private var longitude = 0.0
    
    @State private var isMapShown = false

    var body: some View {
        VStack {
            TextField("Enter an address", text: $address)
                .padding()

            Button("Convert to Coordinates") {
                convertAddressToCoordinates()
            }
            
            Text("Latitude: \(latitude)")
            Text("Longitude: \(longitude)")
            
            if isMapShown {
                Map {
                    Marker(address, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                }
                .frame(height: 200)
            }
        }
        
        
    }

    func convertAddressToCoordinates() {
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(address) { placemarks, error in
            if let error = error {
                print("Geocoding error: \(error.localizedDescription)")
                return
            }
            
            if let placemark = placemarks?.first {
                self.latitude = placemark.location?.coordinate.latitude ?? 0.0
                self.longitude = placemark.location?.coordinate.longitude ?? 0.0
                isMapShown = true
            }
            
        }
    }
}


#Preview {
    AddressLocationManager()
}
