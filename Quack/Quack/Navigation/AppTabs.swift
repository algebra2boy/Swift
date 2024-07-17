//
//  AppTabs.swift
//  Quack
//
//  Created by Yongye on 7/17/24.
//

import Foundation
import SwiftUI

enum AppTabs: String, Equatable, Hashable, Identifiable {
    case order
    case menu
    case analytics
    case search
    
    var id: AppTabs { self }
    
    var name: String {
        switch self {
        case .order:
            "Order"
        case .menu:
            "Menu"
        case .analytics:
            "Analytics"
        case .search:
            "Search"
        }
    }
    
    var icon: String {
        switch self {
        case .order:
            "fork.knife"
        case .menu:
            "menucard"
        case .analytics:
            "dollarsign"
        case .search:
            "magnifyingglass"
        }
    }
    
    /// this will allow us to add/remove tabs
    var customizationID: String {
        "Quack-Tab-View-\(self.name)"
    }
}
