//
//  Visitor.swift
//  SwiftDataDemo
//
//  Created by Yongye Tan on 1/2/24.
//

import Foundation
import SwiftData

@Model
class Visitor: Identifiable, Hashable {
    
    var id: UUID
    var firstName: String
    var lastName: String
    
    var fullName: String {
        firstName + "," + lastName
    }
    
    // This ensures that all related log entries are removed when a visitor is deleted.
    @Relationship(deleteRule: .cascade) var visits = [LogEntry]()
    
    init(id: UUID = UUID(), firstName: String, lastName: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
    }
    
}
