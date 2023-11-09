//
//  NetworkRequest.swift
//  Image
//
//  Created by Yongye Tan on 11/9/23.
//

import SwiftUI

struct NetworkRequest: View {
    
    @State private var data = ""
    
    func fetchServerData() async throws -> String? {
        let url = URL(string: "http://localhost:3000/testing")!
        
        // `URLSession` shared instance is used here for simplicity.
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Convert the data to a string and return it.
        return String(data: data, encoding: .utf8)
    }

    // Call the asynchronous function
    func exampleUsage() async {
        do {
            if let serverResponse = try await fetchServerData() {
                data = serverResponse
                print(serverResponse)
            }
        } catch {
            print("An error occurred: \(error)")
        }
    }
    
    var body: some View {
        Button {
            // handle async
            Task {
                await exampleUsage()
            }
        } label: {
            Text("press me")
        }
        
        Text(data)
    }
}

#Preview {
    NetworkRequest()
}
