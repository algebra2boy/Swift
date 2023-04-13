//
//  Mission.swift
//  Moonshot
//
//  Created by Yongye Tan on 4/13/23.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    let id: Int
    // convert string to Date
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    // computed property
    // good thing about this is to save memory
    var displayName: String {
        return "Apollo \(id)"
    }
    var image: String {
        return "apollo\(id)"
    }
    var displayDate: String {
        return launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
