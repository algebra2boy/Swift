//
//  ContentView.swift
//  AppleWatchDemo Watch App
//
//  Created by Yongye Tan on 1/24/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var quotes: [Quote] = Quote.quotes
    @State private var selectedQuote: Quote? = nil
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                HStack {
                    Spacer()
                    NavigationLink {
                        QuoteListView(quotes: $quotes)
                    } label: {
                        Image(systemName: "arrow.right")
                    }
                }
                
                
                VStack(spacing: 20) {
                    
                    ZStack {
                        Circle()
                            .frame(width: 50)
                        
                        Button {
                            selectedQuote = quotes.randomElement()!
                        } label: {
                            Image(systemName: "questionmark")
                        }
                        .buttonStyle(.borderless)
                        .tint(.blue)
                        .cornerRadius(20)
                        .font(.system(size: 30))
                    }
                    
                    VStack(alignment: .leading) {
                        Text(selectedQuote?.quote ?? "click on question mark")
                            .multilineTextAlignment(.leading)
                            .font(.body)
                        
                        HStack {
                            Spacer()
                            Text(selectedQuote?.author ?? "")
                                .font(.footnote)
                        }
                    }
                    
                }
                .padding()
                
            }
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
