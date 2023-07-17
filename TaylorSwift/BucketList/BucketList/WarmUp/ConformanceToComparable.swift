//
//  ConformanceToComparable.swift
//  BucketList
//
//  Created by Yongye Tan on 7/16/23.
//

import SwiftUI

struct User: Identifiable, Comparable {
        let id = UUID()
        let firstName: String
        let lastName: String

      static func <(lhs: User, rhs: User) -> Bool {
                lhs.lastName < rhs.lastName
        }
}


struct ConformanceToComparable: View {
    @State private var users = [
            User(firstName: "Yongye", lastName: "Tan"),
            User(firstName: "Tina", lastName: "Zou")
    ].sorted()
    var body: some View {
        List {
            ForEach(users) { user in
                Text(user.firstName)
            }
            .onDelete(perform: delete(at:) )
        }
    }
    func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
}
