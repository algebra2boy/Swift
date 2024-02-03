//
//  QuoteListView.swift
//  AppleWatchDemo Watch App
//
//  Created by Yongye Tan on 2/2/24.
//

import SwiftUI

struct QuoteListView: View {
    
    let quotes: [Quote]
    
    var body: some View {
        VStack {
            List {
                ForEach(0 ..< quotes.count, id: \.self) { index in
                    
                    HStack(spacing: 10) {
                        Text("\(index)")
                        
                        VStack (alignment: .leading) {
                            Text(quotes[index].author + ":")
                                .font(.title3)
                            Text(quotes[index].quote)
                                .font(.body)
                        }
                    }
                }
            }
        }
        .navigationTitle("Classic Quotes")
        .navigationBarTitleDisplayMode(.large)
    }
}


#Preview {
    
    let quotes: [Quote] = Quote.quotes
    
    return QuoteListView(quotes: quotes)
}
