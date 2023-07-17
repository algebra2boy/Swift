//
//  FaceIDAuthen.swift
//  BucketList
//
//  Created by Yongye Tan on 7/16/23.
//

import SwiftUI
import LocalAuthentication

struct FaceIDAuthen: View {
    @State private var isUnlocked = false
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        // this is from Objective-C
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    // authenticated successfully
                    isUnlocked = true
                } else {
                    
                }
            }
        } else {
            // no biometrics
        }
        
    }
}

