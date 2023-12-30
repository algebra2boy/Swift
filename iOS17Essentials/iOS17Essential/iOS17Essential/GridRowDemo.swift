//
//  GridRowDemo.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 12/30/23.
//

import SwiftUI

struct GridRowDemo: View {
    var body: some View {
        
        Grid {
            GridRow {
                ForEach(1...5, id: \.self) { index in
                    if (index % 2 == 1) {
                        CellContent(index: index, color: .red)
                    } else {
                        // use gridCellUnsizedAxes to empty teh cell
                        Color.clear
                            .gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                }
            }
            
            GridRow {
                ForEach(6...8, id: \.self) { index in
                    CellContent(index: index, color: .blue)
                }
            }
            
            GridRow {
                ForEach(11...12, id: \.self) { index in
                    CellContent(index: index, color: .yellow)
                }
            }
            
            // its own cell occupies the whole space
            CellContent(index: 16, color: .red)
        }
        .padding()
        
    }
}

struct CellContent: View {
    
    var index: Int
    var color: Color
    
    var body: some View {
        Text("\(index)")
            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
            .background(color)
            .cornerRadius(8)
            .font(.system(.largeTitle))
    }
    
}


#Preview {
    GridRowDemo()
}
