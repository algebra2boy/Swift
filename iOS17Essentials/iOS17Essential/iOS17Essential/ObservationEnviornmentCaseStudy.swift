//
//  ObservationEnviornmentCaseStudy.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 12/27/23.
//

import Foundation
import SwiftUI

struct ObservationEnviornmentCaseStudy: View {
    
    var timerData: TimerData = TimerData()
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Timer count = \(timerData.timeCount)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                
                Button(action: resetCount) {
                    Text("Reset Counter")
                }
                
                NavigationLink {
                    SecondView()
                } label: {
                    Text("Next Screen")
                }
                
            }
        }
        .environment(timerData)
        
    }
    
    func resetCount() {
        timerData.resetCount()
    }
}

struct SecondView: View {
    
    @Environment(TimerData.self) var timerData: TimerData
    
    var body: some View {
        
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
                .font(.headline)
        }
        .padding()
        
    }
    
}

@Observable class TimerData {
    
    var timeCount = 0
    var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(
            withTimeInterval: 1.0, repeats: true, block: { _ in
            self.update()
        })
    }
    
    func update() {
        timeCount += 1
    }
    
    func resetCount() {
        timeCount = 0
    }
    
}

#Preview {
    ObservationEnviornmentCaseStudy()
        .environment(TimerData())
}
