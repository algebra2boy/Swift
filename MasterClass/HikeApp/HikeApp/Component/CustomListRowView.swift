//
//  CustomListRowView.swift
//  HikeApp
//
//  Created by Yongye Tan on 7/10/23.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: - PROPERTIES
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLabelLink: String? = nil
    @State var rowLinkDestination: String? = nil
    
    
    var body: some View {
        LabeledContent {
            // right side
            if let rowContent {
                Text(rowContent)
                    .foregroundStyle(.primary)
                    .fontWeight(.heavy)
            } else if let rowLabelLink, let rowLinkDestination  {
                // URL is an optional value, so we have to unwrap it
                // Open up default browser and go to the direct URL 
                Link(rowLabelLink, destination: URL(string: rowLinkDestination)!)
                    .foregroundStyle(.pink)
                    .fontWeight(.heavy)
            } else {
                EmptyView()
            }
            
        } label: {
            // left side
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 30, height: 30)
                    .foregroundStyle(rowTintColor)
                // overlay has implict Z-stack
                    .overlay {
                        Image(systemName: rowIcon)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .pink)
        CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .green)
        CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .green, rowLabelLink: "github.com/algebra2boy", rowLinkDestination: "github.com/algebra2boy")
    }
}
