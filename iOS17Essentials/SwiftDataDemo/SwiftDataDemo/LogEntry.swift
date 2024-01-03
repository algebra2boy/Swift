//
//  LogEntry.swift
//  SwiftDataDemo
//
//  Created by Yongye Tan on 1/2/24.
//

import Foundation
import SwiftData

@Model
class LogEntry {
    
    var date: Date
    
    init(date: Date) {
        self.date = date
    }
    
}
