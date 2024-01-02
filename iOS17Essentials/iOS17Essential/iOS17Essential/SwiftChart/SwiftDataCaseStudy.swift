//
//  SwiftDataCaseStudy.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 1/1/24.
//

import SwiftUI
import Charts

struct SwiftDataCaseStudy: View {
    
    @State private var tempData: [MonthlyTemp] = [
        .init(month: "Jan", degrees: 50, year: "2021"),
        .init(month: "Feb", degrees: 43, year: "2021"),
        .init(month: "Mar", degrees: 61, year: "2021"),
        .init(month: "Jan", degrees: 30, year: "2022"),
        .init(month: "Feb", degrees: 38, year: "2022"),
        .init(month: "Mar", degrees: 29, year: "2022")
    ]
    
    var body: some View {
        //        Chart {
        //
        //            AreaMark(
        //                x: .value("Month", "Jan"),
        //                y: .value("Temp", 50)
        //            )
        //
        //            AreaMark(
        //                x: .value("Month", "Feb"),
        //                y: .value("Temp", 40)
        //            )
        //
        //            AreaMark(
        //                x: .value("Month", "Mar"),
        //                y: .value("Temp", 60)
        //            )
        //
        //        }
        
        VStack {
            
            Chart(tempData) { data in
                AreaMark(x: .value("Month", data.month),
                         y: .value("Temp", data.degrees)
                )
            }
            
            
            VStack {
                Chart(tempData) { data in
                    RectangleMark(
                        x: .value("Month", data.month),
                        y: .value("Temp", data.degrees)
                    )
                    LineMark(
                        x: .value("Month", data.month),
                        y: .value("Temp", data.degrees)
                    )
                }
            }
            
            VStack {
                Chart {
                    ForEach(tempData) { data in
                        LineMark(
                            x: .value("Month", data.month),
                            y: .value("Temp", data.degrees)
                        )
                        .foregroundStyle(by: .value("Year", data.year))
                        .symbol(by: .value("Year", data.year))
                    }
                }
            }
            
        }
    }
}

struct MonthlyTemp: Identifiable {
    
    var id = UUID()
    var month: String
    var degrees: Double
    var year: String
    
    init(id: UUID = UUID(), month: String, degrees: Double, year: String) {
        self.id = id
        self.month = month
        self.degrees = degrees
        self.year = year
    }
    
}

#Preview {
    SwiftDataCaseStudy()
}
