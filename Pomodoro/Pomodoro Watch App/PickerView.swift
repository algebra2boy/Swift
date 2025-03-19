//
//  PickerView.swift
//  Pomodoro Watch App
//
//  Created by Yongye Tan on 2/3/24.
//

import SwiftUI

struct PickerView: View {
    
    let studyTime: [Int] = [1, 10, 15, 20, 25, 30]
    let restTime: [Int] = [1, 5, 10, 15, 20, 25, 30]
    
    @Binding var studyTimeSelection: Int
    @Binding var restTimeSelection: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Picker("Study time", selection: $studyTimeSelection) {
                ForEach(studyTime, id: \.self) {
                    Text("\($0) 分钟")
                }
            }
            .pickerStyle(.navigationLink)
            
            Picker("Rest time", selection: $restTimeSelection) {
                ForEach(restTime, id: \.self) {
                    Text("\($0) 分钟")
                }
            }
            .pickerStyle(.navigationLink)
        }
        .navigationTitle("Options")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    
    @Previewable @State var studyTimeSelection: Int = 25
    @Previewable @State var restTimeSelection: Int = 5
    
    PickerView(studyTimeSelection: $studyTimeSelection,
               restTimeSelection: $restTimeSelection)
}
