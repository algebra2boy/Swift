//
//  ArchivingObjectsWithCodable.swift
//  iExpense
//
//  Created by Yongye Tan on 3/5/23.
//

import SwiftUI


struct UserUser: Codable {
    let firstName: String
    let lastName : String
}


struct ArchivingObjectsWithCodable: View {
    @State private var user = UserUser(firstName: "Yongye", lastName: "Tan")
    var body: some View {
        Button("Save user data") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "userData")
            }
        }
    }
}

struct ArchivingObjectsWithCodable_Previews: PreviewProvider {
    static var previews: some View {
        ArchivingObjectsWithCodable()
    }
}
