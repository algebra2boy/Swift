//
//  StateOnlyWorksWithStruct.swift
//  iExpense
//
//  Created by Yongye Tan on 3/5/23.
//

import SwiftUI

// a struct has a unique copy of the data
// a class has the copy across multiple views
//struct User {
//    var firstName = "Yongye"
//    var lastName  = "Tan"
//}

// @Published has to follow the protocol (ObservableObject)
class User: ObservableObject {
    // reload the view to reflect the change (using the keyword "published")
    @Published var firstName = "Yongye"
    @Published var lastName  = "Tan"
}


struct StateOnlyWorksWithStruct: View {
    // @State only works with struct
//    @State private var user = User()
    // @StateObject only works with clases
    // StateObject works with initializing a class for the first time (other files are not modifying it), if we want to share across classes, we must use it in other keyword called @ObservedObject
    @StateObject private var user = User()
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("Firstname", text: $user.firstName)
            TextField("Lastname",
                      text:$user.lastName)
        }
    }
}

struct StateOnlyWorksWithStruct_Previews: PreviewProvider {
    static var previews: some View {
        StateOnlyWorksWithStruct()
    }
}
