//
//  MapPreview.swift
//  Image
//
//  Created by Yongye Tan on 11/8/23.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
  static let ILC = CLLocationCoordinate2D(latitude: 42.392380, longitude: -72.524872)
  static let UMB = CLLocationCoordinate2D(latitude: 42.316280, longitude: -71.048203)
}

extension MKCoordinateSpan {
    static let defaultCoordinate = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}

extension MKCoordinateRegion {
    
    static let UMB = MKCoordinateRegion(
        center: .UMB,
        span: .defaultCoordinate
    )
        
}

struct MapPreview: View {
    
    @State private var mapRegion: MKCoordinateRegion = .UMB
    
    var body: some View {
        
        Map(initialPosition: .region(mapRegion), interactionModes: .all) {
                Marker("UMB", coordinate: .UMB)
        }
        .frame(height: 300)
    }
}

#Preview {
    MapPreview()
}
