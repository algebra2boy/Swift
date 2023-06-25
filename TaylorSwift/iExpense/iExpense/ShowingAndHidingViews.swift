//
//  ShowingAndHidingViews.swift
//  iExpense
//
//  Created by Yongye Tan on 3/5/23.
//

import SwiftUI

struct SecondView: View {
    // a current action that dismisses the current presentation
    // allows us to create properties that store values provided to us externally.
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        VStack (spacing: 10) {
            Text("Hello, \(name)")
            Button("Dimiss") {
                dismiss()
            }
        }
    }
}

struct ShowingAndHidingViews: View {
    @State private var showingSheet = false
    var body: some View {
        Button("Show sheet") {
            showingSheet.toggle()
        }
        // after the button is pressed, the second view is shown (very cool)
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Algebra2boy")
        }
    }
}

struct ShowingAndHidingViews_Previews: PreviewProvider {
    static var previews: some View {
        ShowingAndHidingViews()
    }
}
