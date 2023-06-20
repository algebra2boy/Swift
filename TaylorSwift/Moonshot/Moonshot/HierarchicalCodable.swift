//
//  HierarchicalCodable.swift
//  Moonshot
//
//  Created by Yongye Tan on 6/17/23.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city  : String
}

struct HierarchicalCodable: View {
    var body: some View {
        Button("Decode JSON") {
            print("HELLO")
            
            // this is JSON string
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "ABC Street",
                    "city": "Boston"
                }
            }
            """
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            print("hello")
            print(input)
            if let user = try? decoder.decode(User.self, from: data) {
                print(user)
                print(user.address.street)
            }
        }
    }
}

struct HierarchicalCodable_Previews: PreviewProvider {
    static var previews: some View {
        HierarchicalCodable()
    }
}
