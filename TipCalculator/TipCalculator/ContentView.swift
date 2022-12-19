//
//  ContentView.swift
//  TipCalculator
//
//  Created by Yongye Tan on 12/19/22.
//

import SwiftUI

struct ContentView: View {
    @State var total_payment = ""
    @State var tip_percentage = 18.0
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "dollarsign.arrow.circlepath")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .font(.title)
                Text("Tip Calculator")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
            }
            HStack {
                Text("$")
                // text requires a binding variable, something that can be changed by the UI object, the textfield needs authority to modify that variable's value
                // just add @State before the total_payment
                // read only does not require the dollar sign
                // read and write uses the dollar sign
                TextField("Amount", text: $total_payment)
            }
            HStack {
                // tip percent has to be in the range of 1 to 30 and increment/decrement by 1
                Slider(value: $tip_percentage, in: 1...30, step: 1)
                // has to convert a number to a text
                Text("\(tip_percentage)%")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
