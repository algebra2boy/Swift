//
//  URLSession.swift
//  Project10-Cupcake
//
//  Created by Yongye Tan on 4/27/23.
//

import SwiftUI
import Foundation

// response should be codable since result is also codable
struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}


struct URLSession: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
//        do {
//            // Type of expression is ambiguous without more context
//            let (data, response) = try await URLSession.shared.data(from: url)
//            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
//                results = decodedResponse.results
//            }
//
//            // more code to come
//        } catch {
//            print("Invalid data")
//        }
    }
}

struct URLSession_Previews: PreviewProvider {
    static var previews: some View {
        URLSession()
    }
}
