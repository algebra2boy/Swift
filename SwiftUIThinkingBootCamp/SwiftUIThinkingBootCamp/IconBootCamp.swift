//
//  IconBootCamp.swift
//  SwiftUIThinkingBootCamp
//
//  Created by Yongye Tan on 7/16/23.
//

import SwiftUI

struct IconBootCamp: View {
    var body: some View {
        Image(systemName: "battery.100.bolt")
               .resizable()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.brown, .gray, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
        
        Image(systemName: "heart.fill")
            .resizable()
            .scaledToFit()
            .foregroundStyle(Color.red)
            .frame(width: 20, height: 20)
        
        Image(systemName: "message.fill")
            .symbolRenderingMode(.multicolor)
        
        Image(systemName: "bed.double")
            .symbolRenderingMode(.multicolor)
        
        Image(systemName: "person.fill.badge.plus")
            .renderingMode(.original)
        
        
    }
}

#Preview {
    IconBootCamp()
}
