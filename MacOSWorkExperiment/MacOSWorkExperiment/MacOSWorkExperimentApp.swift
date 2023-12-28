//
//  MacOSWorkExperimentApp.swift
//  MacOSWorkExperiment
//
//  Created by Yongye Tan on 6/15/23.
//

import SwiftUI

@main
struct MacOSWorkExperimentApp: App {
    var body: some Scene {
        WindowGroup {
            TableTesting(selectedPerson: .constant(Set()))
                
        }
    }
}
