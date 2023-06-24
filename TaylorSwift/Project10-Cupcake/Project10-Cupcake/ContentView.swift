//
//  ContentView.swift
//  Project10-Cupcake
//
//  Created by Yongye Tan on 4/27/23.
//

import SwiftUI

struct ContentView: View {
    // use this order so data is shared across different screen
    @StateObject var order = Order()
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        // we store order.type as a intercer
                        // use indices property of the array that we can then use with as an array index
                        // Order.types.indices return a range
                        ForEach(Order.types.indices, id: \.self) {
                            // $0 is an integer
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    // animation() adds a smooth effect
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
