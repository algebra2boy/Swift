//
//  PieChart.swift
//  Image
//
//  Created by Yongye Tan on 11/8/23.
//

import SwiftUI
import Charts

struct PieChart: View {
    
    private var coffeeSales = [
        (name: "Americano", count: 120),
        (name: "Cappuccino", count: 234),
        (name: "Espresso", count: 62),
        (name: "Latte", count: 625),
        (name: "Mocha", count: 320),
        (name: "Affogato", count: 50)
    ]
    
    var body: some View {
        VStack {
            Chart {
                ForEach(coffeeSales, id: \.name) { coffee in
                    // customize the pie chart
                    SectorMark(
                        angle: .value("Cup", coffee.count),
                        angularInset: 2.0
                    )
                    
                    // add marker at the bottom
                    .foregroundStyle(by: .value("Type", coffee.name))
                    
                    // add count to middle of the pie slice
                    .annotation(position: .overlay) {
                        Text("\(coffee.count)")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
            }
            .frame(height: 500)
        }
        .padding()
        
    }
}

#Preview {
    PieChart()
}
