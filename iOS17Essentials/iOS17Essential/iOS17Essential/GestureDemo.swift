//
//  GestureDemo.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 12/31/23.
//

import SwiftUI

struct GestureDemo: View {
    
    @State private var magnification: CGFloat = 1.0
    
    let tap = TapGesture(count: 2)
        .onEnded { _ in
            print("tapped")
        }
    
    let longPressed = LongPressGesture(minimumDuration: 2)
        .onEnded { _ in
            print("longPress")
        }
    
    var body: some View {
        VStack {
            Text("Double Tapped!")
                .gesture(tap)
            
            Text("LongPress")
                .gesture(longPressed)
            
            Image(systemName: "hand.point.right.fill")
                .resizable()
                .font(.largeTitle)
                .scaleEffect(magnification)
                .gesture(
                    MagnificationGesture()
                        .onChanged({ value in
                            self.magnification = value
                        })
                        .onEnded({ _ in
                            print("Gesture Ended")
                        })
                )
                .frame(width: 100, height: 90)
        }
    }
}

struct GestureStateDemo: View {
    
    // automatically reset to the original state when the gesture ends.
    @GestureState private var offset: CGSize = .zero
    @State private var dragEnabled: Bool = false
    
    var body: some View {
        
//        let drag = DragGesture()
//            .updating($offset) { dragValue, state, transaction in
//                state = dragValue.translation
//            }
        
        let longPressBeforeDrag = LongPressGesture(minimumDuration: 2.0)
            .onEnded( { _ in
                self.dragEnabled = true
            })
            .sequenced(before: DragGesture())
            .updating($offset) { value, state, transaction in
                switch value {
                case .first(true):
                    print("Long press in progress")
                case .second(true, let drag):
                    state = drag?.translation ?? .zero
                    
                default: break
                }
                
            }
            .onEnded { value in
                self.dragEnabled = false
            }
        
        
        //        Image(systemName: "hand.point.right.fill")
        //            .font(.largeTitle)
        //            .offset(offset)
        //            .gesture(drag)
        //
        Image(systemName: "hand.point.right.fill")
            .foregroundColor(dragEnabled ? Color.red : Color.blue)
            .font(.largeTitle)
            .offset(offset)
            .gesture(longPressBeforeDrag)
        
    }
    
}

#Preview {
    GestureDemo()
}

#Preview {
    GestureStateDemo()
}
