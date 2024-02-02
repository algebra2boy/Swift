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
                    NavigationLink {
                        QuoteListView(quotes: $quotes)
                    } label: {
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                }
                
                
                VStack(spacing: 20) {
                    
                    ZStack {
                        Circle()
                            .frame(width: 50)
                        
                        Button {
                            withAnimation {
                                selectedQuote = quotes.randomElement()!
                            }
                        } label: {
                            Image(systemName: "questionmark")
                        }
                        .buttonStyle(.borderless)
                        .tint(.blue)
                        .cornerRadius(20)
                        .font(.system(size: 30))
                    }
                    
                    VStack(alignment: .center, spacing: 5) {
                        Text(selectedQuote?.quote ?? "click on question mark")
                            .multilineTextAlignment(.leading)
                            .font(.body)
                        
                        Text(selectedQuote?.author ?? "")
                            .font(.footnote)
                        
                    }
                    
                }
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
