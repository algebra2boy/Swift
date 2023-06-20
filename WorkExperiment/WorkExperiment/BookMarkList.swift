//
//  BookMarkList.swift
//  WorkExperiment
//
//  Created by Yongye Tan on 5/30/23.
//

import SwiftUI

struct BookMarkList: View {
    @State private var links: [URL] = [
        URL(string: "https://twitter.com/mecid")!
    ]
    
    var body: some View {
        List {
            ForEach(links, id: \.self) { (url) in
                Text(url.absoluteString)
                    .draggable(url) {
                        Text(verbatim: url.absoluteString)
                    }
            }
            .dropDestination(for: URL.self) { items, location in
                links.append(contentsOf: items)
            }
        }
        .navigationTitle("Bookmarks")
    }
}


struct BookMarkList_Previews: PreviewProvider {
    static var previews: some View {
        BookMarkList()
    }
}
