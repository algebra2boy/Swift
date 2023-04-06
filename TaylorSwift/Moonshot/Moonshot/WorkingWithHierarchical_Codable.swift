//
//  WorkingWithHierarchical_Codable.swift
//  Moonshot
//
//  Created by Yongye Tan on 4/5/23.
//




import SwiftUI
/*
The Codable protocol makes it trivial to decode flat data: if you’re decoding a single instance of a type, or an array or dictionary of those instances
 */

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city  : String
}

struct WorkingWithHierarchical_Codable: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button("Decode JSON") {
            let input = """
            {
                "name": "Yongye",
                "address" : {
                    "street": "Apple street",
                    "city": "Amherst"
                }
            }

            """
            // we can convert our JSON string to the Data type
            // the name of the key must match the field name in the struct 
            let data = Data(input.utf8)
            if let user = try? JSONDecoder().decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

struct WorkingWithHierarchical_Codable_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithHierarchical_Codable()
    }
}
