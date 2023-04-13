//
//  Color-Theme.swift
//  Moonshot
//
//  Created by Yongye Tan on 4/13/23.
//

import Foundation
import SwiftUI

// only extend to color
// customize the color schema
extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
