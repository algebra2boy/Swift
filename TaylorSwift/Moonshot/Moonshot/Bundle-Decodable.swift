//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Yongye Tan on 4/5/23.
//

import Foundation

extension Bundle {
    // <T> is generic type
    // could be any type that works on any data
    // T must confrom decodable, so it would need to use Codable
    func decode<T: Codable>(_ file: String) -> T{
        // need to use Bundle to find the path to the file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        // load that into an instance of Data,
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        // convert the json file to the swift dictionary form 
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        return loaded
    }
}
