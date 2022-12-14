//
//  Cell.swift
//  TicTacToeSwiftUI
//
//  Created by Yongye Tan on 11/21/22.
//

import Foundation
import SwiftUI // must include this to get the Color

struct Cell {
    
    var tile : Tile
    
    func displayTile () -> String {
        
        switch (tile) {
        case Tile.Circle:
            return "O"
        case Tile.Cross:
            return "X"
        default:
            return ""
        }
    }
    
    func tileColor () -> Color {
        
        switch (tile) {
        case Tile.Circle:
            return Color.red
        case Tile.Cross:
            return Color.black
        default:
            return Color.black
        }
    }
    
}

// specifying the state of Title
enum Tile {
    case Circle, Cross, Empty
}
