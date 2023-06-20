//
//  Mission.swift
//  Moonshot
//
//  Created by Yongye Tan on 6/18/23.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date? // it is optional, some other items do have this variable
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        // format date
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
