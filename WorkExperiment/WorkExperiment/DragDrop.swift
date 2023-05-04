//
//  DragDrop.swift
//  WorkExperiment
//
//  Created by Yongye Tan on 5/4/23.
//

import SwiftUI


// define color item view
struct ColorItemView: View {
    
    let backGroundColor: Color
    
    var body: some View {
        HStack {
            Spacer() // all the way to left
            Text(backGroundColor.description.capitalized)
            Spacer() // all the way to right
        }
        .padding(.vertical, 40)
        .background(backGroundColor)
        .cornerRadius(20)
    }

}

struct DropViewDelegate: DropDelegate {
    let destinationItem: Color
    @Binding var colors: [Color]
    @Binding var draggedItem: Color?
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    
    func performDrop(info: DropInfo) -> Bool {
        draggedItem = nil
        return true
    }
    
    func dropEntered(info: DropInfo) {
        // swap Items
        if let draggedItem {
            let fromIndex = colors.firstIndex(of: draggedItem)
            if let fromIndex {
                let toIndex = colors.firstIndex(of: destinationItem)
                if let toIndex, fromIndex != toIndex {
                    withAnimation {
                        self.colors.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: (toIndex > fromIndex ? (toIndex + 1): toIndex))
                    }
                }
            }
        }
    }
    
}



struct DragDrop: View {
    
    @State private var draggedColor: Color?
    @State private var colors: [Color] = [.red, .green, .yellow, .blue, .orange, .cyan]
    
    var body: some View {
        ScrollView {
            VStack (spacing: 10) {
                Spacer() // put space on top to prevent go out of screen
                    .frame(height: 60)

                // iterate on each color
                ForEach(colors, id: \.self) { color in
                    ColorItemView(backGroundColor: color)
                    // add a drag support that handles the dragging
                        .onDrag {
                            self.draggedColor = color
                            return NSItemProvider()
                        }
                        .onDrop(of: [.text], delegate:
                                    DropViewDelegate(destinationItem: color,
                                                     colors: $colors, draggedItem: $draggedColor))
                    
                }


            }
            .padding(.horizontal, 20)
            
        }
        .ignoresSafeArea()
        .background(Color.brown)
    }
}




struct DragDrop_Previews: PreviewProvider {
    static var previews: some View {
        DragDrop()
    }
}
