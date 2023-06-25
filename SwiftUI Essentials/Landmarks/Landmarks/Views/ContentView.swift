//
//  ContentView.swift
//  Landmarks
//
//  Created by Yongye Tan on 6/24/23.
//

import SwiftUI

struct ContentView: View {
    // Use the @StateObject attribute to initialize a model object for a given property only once during the life time of the app. This is true when you use the attribute in an app instance, as shown here, as well as when you use it in a view.
    @StateObject private var modelData = ModelData()
    
    // StateObject and Observable
    // and inject the stateobject as an enviornemnt object to any subview
    
    var body: some View {
        LandmarkList()
            // add the model object to the environment, which makes the object available to any subview.
            .environmentObject(modelData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
