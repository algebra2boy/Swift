//
//  BestRestView.swift
//  BestRest
//
//  Created by Yongye Tan on 1/26/23.
//

import SwiftUI
import CoreML

struct BestRestView: View {
    @State private var wakeUp = defaultWakeup
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    // default wake up is 8 am
    // defaultWakeUp should belong to the struct, not to a particular instance
    // share among all the struct
    static var defaultWakeup : Date {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        
        // if default does not work, then new default would be the current now
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    
    
    var body: some View {
        NavigationView {
            Form { // try VStack(alignment: .leading, spacing: 10)
                Section { // try Form
//                    Text("When do you want to wake up??")
//                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                } header: {
                    Text("When do you want to wake up??")
                        .font(.headline)
                }
                
                Section { // VStack(alignment: .leading, spacing: 10)
//                    Text("Desired amount of sleep")
//                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                } header: {
                    Text("Desired amount of sleep")
                        .font(.headline)
                }
                
                Section { // VStack(alignment: .leading, spacing: 10)
                    // Text("Daily coffee intake")
                    //   .font(.headline)
                    
                    // Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                    
                    Picker("Coffee", selection: $coffeeAmount) {
                        ForEach(0..<9) {
                            Text($0 > 1 ? "\($0) cups" : "\($0) cup")
                        }
                    }
            
                    
                } header: {
                    Text("Daily coffee intake")
                        .font(.headline)
                }
                
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
