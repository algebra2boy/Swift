//
//  NavSplitDemo.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 12/29/23.
//

import SwiftUI

struct NavSplitDemo: View {
    
    @State private var categories: [IconCategory] = [
        .init(categoryName: "Folders", images: ["questionmark.folder.ar",
                                                "questionmark.folder",
                                                "questionmark.folder.fill.ar",
                                                "folder.fill.badge.gear",
                                                "questionmark.folder.fill"]),
        .init(categoryName: "Circles", images: ["book.circle",
                                                "books.vertical.circle",
                                                "books.vertical.circle.fill",
                                                "book.circle.fill"]),
    ]
    
    @State private var selectedCategory: IconCategory? = nil
    @State private var selectedImage: String?
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(categories, selection: $selectedCategory) { category in
                Text(category.categoryName)
                    .tag(category)
            }
        } content: {
            if let selectedCategory {
                List(selectedCategory.images, id: \.self,
                     selection: $selectedImage) { image in
                    HStack {
                        Image(systemName: image)
                        Text(image)
                    }
                    .tag(image)
                }
            } else {
                Text("Select a category")
            }
        } detail: {
            if let selectedImage {
                Image(systemName: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } else {
                Text("Select an image")
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}


struct IconCategory: Identifiable, Hashable {
    let id = UUID()
    var categoryName: String
    var images: [String]
    
    public init(categoryName: String, images: [String]) {
        self.categoryName = categoryName
        self.images = images
    }
    
}

#Preview {
    NavSplitDemo()
}
