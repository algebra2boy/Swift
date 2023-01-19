//
//  ButtonView.swift
//  GuessTheFlag
//
//  Created by Yongye Tan on 1/18/23.
//

import SwiftUI

struct ButtonView: View {
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Button("Delete selction", role: .cancel, action: executeDelete)
            
            Button("Button 1") {}
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) {
            }
            .buttonStyle(.bordered)
            Button("Button 3") {}
                .buttonStyle(.borderedProminent)
            Button("Button 4", role: .destructive) {}
                .buttonStyle(.borderedProminent)
            
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundColor(.white)
                    .background(.red)
            }
            Image(systemName: "pencil")
                .aspectRatio(100, contentMode: .fill)
            
            Button("Show alert") {
                showAlert = true
            }
            .alert("Important message", isPresented: $showAlert) {
                Button("Delete", role: .destructive) {}
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Please read this!")
            }
            
            
        }
    }
     
    func executeDelete() {
        print("Now deleting")
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
