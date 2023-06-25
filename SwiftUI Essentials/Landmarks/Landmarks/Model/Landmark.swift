//
//  Landmark.swift
//  Landmarks
//
//  Created by Yongye Tan on 6/24/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Codable, Hashable, Identifiable {
    // did not include all the property from the json
    // only get the ones that we need
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    // We make the property private because users of the Landmarks structure care only about the image itself.
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinate
    var locationCoordination: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinate: Codable, Hashable {
        var longitude: Double
        var latitude : Double
    }
}
