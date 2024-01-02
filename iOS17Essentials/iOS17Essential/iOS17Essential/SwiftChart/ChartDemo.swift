//
//  ChartDemo.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 1/1/24.
//

import SwiftUI
import Charts

struct ChartDemo: View {
    
    let sales = [
        (channel: "Retail", data: retailSales),
        (channel: "Online", data: onlineSales)
    ]
    
    
    var body: some View {
        Chart {
            ForEach(sales, id: \.channel) { channels in
                ForEach(channels.data) { sales in
                    PointMark(x: .value("Month", sales.month),
                             y: .value("Total", sales.total)
                    )
                    .foregroundStyle(by: .value("Channel", channels.channel))
                }
            }
        }
        .frame(height: 250)
        .padding()
    }
}

struct SalesInfo: Identifiable {
    
    var id = UUID()
    var month: String
    var total: Int
    
}

var retailSales: [SalesInfo] = [
    .init(month: "Jan", total: 5),
    .init(month: "Feb", total: 7),
    .init(month: "March", total: 6),
    .init(month: "April", total: 5),
    .init(month: "May", total: 6),
    .init(month: "June", total: 3),
    .init(month: "July", total: 6)
]

var onlineSales: [SalesInfo] = [
    .init(month: "Jan", total: 2),
    .init(month: "Feb", total: 4),
    .init(month: "March", total: 5),
    .init(month: "April", total: 2),
    .init(month: "May", total: 4),
    .init(month: "June", total: 1),
    .init(month: "July", total: 4)
]

#Preview {
    ChartDemo()
}
