//
//  ContentView.swift
//  MacOSWorkExperiment
//
//  Created by Yongye Tan on 6/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var testing = ""
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            TextField("Testing", text: $testing, axis: .vertical)
//                .textFieldStyle(.squareBorder)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
