//
//  MovieAPI.swift
//  WorkExperiment
//
//  Created by Yongye Tan on 10/16/23.
//  Source: https://www.swiftwithvincent.com/blog/how-to-write-your-first-api-call-in-swift

import SwiftUI

struct MoviesResponse: Codable {
    // the name, "results" must match with the key name on the API response, and the output must be an array
    let results: [Movie]
}

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
}

struct MovieAPI: View {
    
    @State private var movies: [Movie] = []
    
    let APIKey = "0cf0e4f21e694fce8f9dcbddf4116724"
    
    func fetchMoviesFromAPI() async throws -> [Movie] {
        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(APIKey)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoded = try JSONDecoder().decode(MoviesResponse.self, from: data)
        
        return decoded.results
    }
    
    
    var body: some View {
                
        List {
            ForEach(movies) { movie in
                VStack (alignment: .leading) {
                    HStack {
                        Text(String(movie.id))
                        Text(movie.title)
                            .truncationMode(.tail)
                            .lineLimit(1)
                            .font(.headline)
                    }
                    
                    HStack {
                        Text(movie.overview)
                            .multilineTextAlignment(.leading)
                            .font(.subheadline)
                    }
                }
            }
        }.task {
            do {
                movies = try await fetchMoviesFromAPI()
            } catch {
                print(error)
            }
        }
    }
}


#Preview {
    MovieAPI()
}
