//
//  CodableConformance.swift
//  Project10-Cupcake
//
//  Created by Yongye Tan on 4/27/23.
//

import SwiftUI

class User: ObservableObject, Codable {
//   we need to make the type conform ourselves: we need to tell Swift which properties should be loaded and saved, and how to do both of those actions.
    enum CodingKeys: CodingKey {
        case name
    }

    @Published var name: String = "Yongye"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
    
    
}

struct CodableConformance: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CodableConformance_Previews: PreviewProvider {
    static var previews: some View {
        CodableConformance()
    }
}
