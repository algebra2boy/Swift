//
//  FrameBootCamp.swift
//  SwiftUIThinkingBootCamp
//
//  Created by Yongye Tan on 7/16/23.
//

import SwiftUI

struct FrameBootCamp: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background(Color.green)
//            .frame(width: 100, height: 100, alignment: .center)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color.red)
        
        Text("HELLO")
            .background(Color.red)
            .frame(height: 100, alignment: .top)
            .background(Color.orange)
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
    }
}

#Preview {
    FrameBootCamp()
}
