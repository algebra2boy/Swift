//
//  SidebarOption.swift
//  FirstIpadApp
//
//  Created by Yongye on 7/16/24.
//

import Foundation
import SwiftUI

public enum SidebarOption: Identifiable, Hashable {
    case order
    
    public var id: SidebarOption { self }
    
    
    var label: some View {
        switch self {
        case .order:
            // TODO: figure how localized string key words here
            Label("order", image: "fork.knief")
        }
    }
    
    var destination: some View {
        switch self {
        case .order:
            <#code#>
        }
    }
    
}
