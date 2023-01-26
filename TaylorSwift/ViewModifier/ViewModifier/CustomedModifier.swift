//
//  CustomedModifier.swift
//  ViewModifier
//
//  Created by Yongye Tan on 1/25/23.
//

import SwiftUI

// custom view modifiers can have their own stored properties, whereas extensions to View cannot.
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}


struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}



struct CustomedModifier: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .titleStyle()
            
            Color.blue
                .frame(width: 300, height: 300)
                .watermarked(with: "Yongye")
        }
        
    }
}

struct CustomedModifier_Previews: PreviewProvider {
    static var previews: some View {
        CustomedModifier()
    }
}
