//
//  Location.swift
//  BucketList
//
//  Created by Yongye Tan on 7/16/23.
//

import Foundation
import MapKit

struct MapLocation: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static let example = MapLocation(id: UUID(), name: "Bucking ham Palace", description: "Where Queen Elizabeth lives with her dorgis", latitude: 51.501, longitude: -0.141)
    
    // since Maplocation confroms Equatable protocol, swift will write this function(==) for us by
    // comparing every property against every other proeprty,which is rather wasteful
    // so we instead compare their id
    static func ==(lhs: MapLocation, rhs: MapLocation) -> Bool {
        lhs.id == rhs.id
    }
}
