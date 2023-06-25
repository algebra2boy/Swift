//
//  mapView.swift
//  Landmarks
//
//  Created by Yongye Tan on 6/24/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion()
    
    
    var body: some View {
        Map(coordinateRegion: $region)
            // triggers a calculation of the region based on the current coordinate
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    /// updates the region based on a coordinate value
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
