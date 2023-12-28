//
//  StorageDemo.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 12/27/23.
//

import SwiftUI

struct StorageDemo: View {
    var body: some View {
        
        TabView {
            
            SceneStorageView()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("SceneStorage")
                }
            
            AppStorageView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("AppStorage")
                }
            
        }
        
    }
}

struct SceneStorageView: View {
    
    @SceneStorage("storage") private var editorText: String = ""
    
    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
    
}

struct AppStorageView: View {
    
    @AppStorage("mytext") var editorText: String = "Sample Text"
    
    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
    
}

#Preview {
    StorageDemo()
}
