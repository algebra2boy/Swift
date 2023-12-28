//
//  TabViewCaseStudy.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 12/27/23.
//

import SwiftUI

struct TabViewCaseStudy: View {
    var body: some View {
        TabView {
            FirstTabView()
                .tabItem {
                    Image(systemName: "01.circle")
                    Text("First")
                }
            SecondTabView()
                .tabItem {
                    Image(systemName: "02.circle")
                    Text("Second")
                }
        }
    }
}

struct FirstTabView: View {
    
    @State var title: String = "View One"
    
    var body: some View {
        Text(title)
            .onAppear(perform: {
                print("onAPpear trigger")
            })
            .onDisappear(perform: {
                print("onAPpear trigger")
            })
            .task(priority: .background, {
                title = await changeTitle()
            })
    }
    
    func changeTitle() async -> String {
        sleep(5)
        return "Async task complete"
    }
}

struct SecondTabView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        TextEditor(text: $text)
            .padding()
            .onChange(of: text) {
                print("onChange triggered")
            }
    }
}

#Preview {
    TabViewCaseStudy()
}
