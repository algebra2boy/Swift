//
//  CheckoutView.swift
//  Project10-Cupcake
//
//  Created by Yongye Tan on 6/23/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    // progress view indicator
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                
                Button("Place order") {
                    // similar to .task, a modifier
                    // but Task is for actions
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
                
            }
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        
        .alert("Thank you", isPresented: $showingConfirmation) {
            Button("Okay") {
                
            }
        } message: {
            Text(confirmationMessage)
        }
    }
    
    /// async function that sends data to the network
    func placeOrder() async {
        // convert swift object to JSON using encoder
        // only works if order confroms to Codable protocol and implement the encode function
        guard let encoded  = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        guard let url = URL(string: "https://reqres.in/api/cupcakes") else {
            print("cupcake URL failed to load")
            return
        }
        
        // set up configuration such as the header and http method
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        // use URLSession.shared.upload() to send it over network
        do {
            // might throw an error (therefore we must need a do try catch)
            // data is JSON string
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            // only works if Order confroms to Codable and implement decode function
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            print(decodedOrder.streetAddress)
            self.confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way"
            
            self.showingConfirmation = true
        } catch {
            self.confirmationMessage = "No internet access"
            self.showingConfirmation = true
            print(error)
        }
        
//        if there is an error, data and response would be nil (both ways work)
//        if let (data, _) = try? await URLSession.shared.upload(for: request, from: encoded) {
//            print(data)
//        } else {
//            print("there is an error")
//            print("there is an error, therefore data is nil")
//        }
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
