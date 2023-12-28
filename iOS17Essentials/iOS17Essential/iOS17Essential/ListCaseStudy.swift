//
//  ListCaseStudy.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 12/27/23.
//

import SwiftUI

struct ListCaseStudy: View {
    var body: some View {
        List {
            HStack {
                Image(systemName: "trash.circle.fill")
                Text("Take out the trash")
            }
            .listRowSeparator(.hidden)
            HStack {
                Image(systemName: "person.2.fill")
                Text("Pick up the kids")
            }
            .listRowSeparatorTint(.green)
            HStack {
                Image(systemName: "car.fill")
                Text("Wash the car")
            }
            .listRowSeparatorTint(.red)
            HStack {
                Image(systemName: "mug.fill")
                Text("Order Pizza for dinner")
            }
        }
    }
}



#Preview {
    ListCaseStudy()
}
