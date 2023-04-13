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
    // could be there
    let launchDate: String?
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
}
