//
//  ContentView.swift
//  BestRest
//
//  Created by Yongye Tan on 1/26/23.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepHour = 8.0
    @State private var wakeup = Date.now
    
    var body: some View {
        VStack (spacing: 30) {
            // a stepper that goes up and down 0.25 hours and hours must be between 4 and 12 hours
            Stepper("\(sleepHour.formatted()) hours", value: $sleepHour, in: 4...12, step: 0.25)
            
            DatePicker("Enter a date",selection: $wakeup)
            // hidding the label
            DatePicker("Enter a date",selection: $wakeup)
                .labelsHidden()
            // only showing the hour and minute
            DatePicker("Enter a date",selection: $wakeup, displayedComponents: .hourAndMinute)
            // only showing the day
            DatePicker("Enter a date",selection: $wakeup, displayedComponents: .date)
            
            // only showing the day after today
            DatePicker("Enter a date",selection: $wakeup, in: Date.now...)
            
            // only showing the day before today
            DatePicker("Enter a date",selection: $wakeup, in: ...Date.now)
            
            Text(wakeup, format: .dateTime.day().month().year().hour().minute().second())
            Text(wakeup.formatted(date: .long, time: .omitted))
        }
        .padding()
    }
    
    func trivialExample() {
        let now = Date.now
        // 86400 seconds in a day
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = now...tomorrow
        
        // extract hour and minute from today's date
        let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
