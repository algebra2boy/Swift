//
//  ContentView.swift
//  UnitConversion
//
//  Created by Yongye Tan on 1/16/23.
//

import SwiftUI

struct ContentView: View {
    @State var input: Double = 0.0
    @State var input_unit: String = "kilometer"
    @State var output_unit: String = "kilometer"
    let units: [String] = ["kilometer", "meter", "feet", "miles"]
    
    var measure_in_meter: Double {
        var measurment = input
        
        switch input_unit {
        case "kilometer":
            measurment = input * 1000
        case "meter":
            break
        case "feet":
            measurment = input * 0.3048
        case "miles":
            measurment = input * 1609.34
        default:
            measurment = 0
        }
        return measurment
    }
    
    var output_measure: Double {
        var measurment = measure_in_meter
        switch output_unit {
        case "kilometer":
            measurment = measurment / 1000
        case "meter":
            break
        case "feet":
            measurment = measurment / 0.3048
        case "miles":
            measurment = measurment / 1609.34
        default:
            measurment = 0
        }
        
        return measurment
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("please input your unit", value: $input, format: .number)
                } header: {
                    Text("Input section")
                }
                .keyboardType(.decimalPad)
                
                Section {
                    Picker("Choose one unit", selection: $input_unit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Choose your input unit")
                }
                
                Section {
                    Picker("Choose one unit", selection: $output_unit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Choose your output unit")
                }
                
                Section {
                    Text("\(output_measure) \(output_unit)")
                } header: {
                    Text("output section")
                }
                
                
            }
            .navigationTitle("Unit Conversion")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
