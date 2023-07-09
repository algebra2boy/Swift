//
//  ContentView.swift
//  Restart
//
//  Created by Yongye Tan on 12/29/22.
//

import SwiftUI

struct ContentView: View {
    // provide permanent storage
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                onBoardingView()
            }else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
