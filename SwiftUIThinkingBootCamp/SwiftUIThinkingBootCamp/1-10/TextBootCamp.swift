//
//  TextBootCamp.swift
//  SwiftUIThinkingBootCamp
//
//  Created by Yongye Tan on 7/16/23.
//

import SwiftUI

struct TextBootCamp: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.title)
                .fontWeight(.black)
                .foregroundStyle(Color.red)
                .bold()
                .strikethrough(true, color: Color.green)
                .underline(true, color: Color.black)
            
            //            .font(.system(size: 24, weight: .semibold, design: .serif))
            
            Text("Hello world! This is the SwiftUI thinking Bootcamp. I am really enjoying this course and learning a lot")
                // the spacing between characters
                .kerning(2)
                .multilineTextAlignment(.center)
                .foregroundStyle(.red)
                .frame(width: 200, height: 200, alignment: .leading)
                // Sets the minimum amount that text in this view scales down to fit in the available space.
                .minimumScaleFactor(0.1)
            
        }
        
        
    }
}

struct TextBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootCamp()
    }
}
