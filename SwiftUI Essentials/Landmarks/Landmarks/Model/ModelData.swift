//
//  ModelData.swift
//  Landmarks
//
//  Created by Yongye Tan on 6/24/23.
//

import Foundation
import Combine

// use final becuase there is no subclasses
final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}


/// accept a filename and return a genric codable data
func load<T: Codable>(_ filename: String) -> T {
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("could not find \(filename) in main bundle")
    }
    
    guard let data = try? Data(contentsOf: file) else {
        fatalError("Could't load \(filename) from main bundle")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self)")
    }
    
}
