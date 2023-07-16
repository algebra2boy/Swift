//
//  ShapesBootcamp.swift
//  SwiftUIThinkingBootCamp
//
//  Created by Yongye Tan on 7/16/23.
//

import SwiftUI

struct ShapesBootcamp: View {
    var body: some View {
        Circle()
            .fill(Color.green)
            .foregroundStyle(Color.pink)
        
        Circle()
//            .stroke(Color.blue)
//            .stroke(Color.blue, lineWidth: 30)
//            .stroke(lineWidth: 30)
        
            .trim(from: 0.3, to: 2.0)
            .stroke(Color.blue, lineWidth: 30)
        
        RoundedRectangle(cornerRadius: 30)
            .fill(Color.blue)
            .frame(width: 50, height: 50)
            .overlay {
                Image(systemName: "apple.logo")
            }
        
    }
}

struct ShowingAMenu: View {
    var body: some View {
        Text("Hello world")
            .overlay (alignment: .bottom) {
                ContextMenu()
            }
    }
}

struct ContextMenu: View {
    var body: some View {
        // helps position the location
        GeometryReader { geo in
            // create a list of options
            HStack {
                Button(action: {
                    print("I am being pressed")
                }) {
                    Image(systemName: "apple.logo")
                }
                .buttonStyle(.plain)
                .foregroundStyle(.black)
                
            }
            // make the sliver background capsule shape
            .font(.system(size: 15))
            .padding()
            .background(
                Capsule()
                    .foregroundStyle(.thinMaterial)
            )
            // position modifier that positions it
            .position(CGPoint(x: geo.size.width / 2.0, y: geo.size.height + 30))
        }
        
    }
            
}
    
        /*
        Circle()
        Ellipse()
        Capsule()
        Rectangle()
        RoundRectangle()

        */
#Preview {
    ShowingAMenu()
}
