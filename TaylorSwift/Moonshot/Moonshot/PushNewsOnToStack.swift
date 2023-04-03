//
//  PushNewsOnToStack.swift
//  Moonshot
//
//  Created by Yongye Tan on 4/2/23.
//

import SwiftUI

/*
     both sheet() and NavigationLink allow us to show a new view from the current one, but the way they do it is different and you should choose them carefully:

 NavigationLink is for showing details about the user’s selection, like you’re digging deeper into a topic.
 sheet() is for showing unrelated content, such as settings or a compose window.
 */


struct PushNewsOnToStack: View {
    var body: some View {
        NavigationView {
            
            List(0..<100) { row in
                // usually it can be done using sheet
                
                // direct user to another page when the view is being clicked
                NavigationLink {
                    Text("Detail View \(row)")
                } label: {
                    Text("row \(row)")
                        .padding()
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct PushNewsOnToStack_Previews: PreviewProvider {
    static var previews: some View {
        PushNewsOnToStack()
    }
}
