//
//  BestRestView.swift
//  BestRest
//
//  Created by Yongye Tan on 1/26/23.
//

import SwiftUI
import CoreML

struct BestRestView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("When do you want to wake up")
                    .font(.headline)
                
                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired amount of sleep")
                    .font(.headline)
                
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                
                Text("Daily coffee intake")
                    .font(.headline)
                
                Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
            }
            .navigationTitle("BetterRest")
            // put the button on the top right of the screen 
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("Okay"){
                    print("alert button is being pressed")
                    print(alertMessage)
                }
            } message: {
                Text(alertMessage)
            }
        }
    }

    func calculateBedTime() {
        do {
            // this is assuming that we have a trained .mlmodel file
            let configuration = MLModelConfiguration()
            // using this particular sleepCalculator omdel
            let MLmodel = try sleepCalculator(configuration: configuration)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60 * 60
            
            let prediction = try MLmodel.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            
            alertTitle = "error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
    
}

struct BestRestView_Previews: PreviewProvider {
    static var previews: some View {
        BestRestView()
    }
}
