//
//  Contact.swift
//  SwiftDataDemo
//
//  Created by Yongye Tan on 1/2/24.
//

import Foundation
import SwiftData

@Model
public class Contact {
    
    var firstName: String
    var lastName: String
    var address: String
    
    init(firstName: String, lastName: String, address: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
    }
    
}
