//
//  FormData.swift
//  Project10-Cupcake
//
//  Created by Yongye Tan on 4/27/23.
//

import SwiftUI

struct FormData: View {
    @State private var username = ""
    @State private var email = ""
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("email", text: $email)
            }
            
            Section {
                Button("Create an account") {
                    print("an account is created")
                }
                .disabled(disableForm)
            }
        }
    }
    
    var disableForm: Bool {
        return username.count < 5 || email.count < 5
    }
}

struct FormData_Previews: PreviewProvider {
    static var previews: some View {
        FormData()
    }
}
