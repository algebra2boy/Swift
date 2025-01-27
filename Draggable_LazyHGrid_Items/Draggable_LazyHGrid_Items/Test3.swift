//
//  Test3.swift
//  Draggable_LazyHGrid_Items
//
//  Created by Yongye Tan on 1/27/25.
//

import SwiftUI

struct DragAndDropView: View {
    
    //State values
    @State private var leftItems = Array(1...10)
    @State private var rightItems = Array(11...20)
    
    //Body
    var body: some View {
        HStack(alignment: .top) {
            DragAndDropGrid(items: $leftItems)
            DragAndDropGrid(items: $rightItems, color: .yellow)
        }
        .padding()
    }
}

struct DragAndDropGrid: View {
    
    //Parameters
    @Binding var items: [Int]
    var color: Color = Color.green

    //State values
    @State private var draggedItem: Int?
    @State private var targetItem: Int?
    
    //Grid columns
    let columns = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80))
    ]
    
    //Body
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(items, id: \.self) { item in
                Text("\(item)")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(color, in: RoundedRectangle(cornerRadius: 8))
                    .contentShape(.dragPreview, RoundedRectangle(cornerRadius: 8))
                    .opacity(draggedItem == item ? 0.3 : (targetItem == item ? 0.3 : 1))
                    .onDrag {
                        
                        // Only set draggedItem if it's not already set (prevents re-setting it after drop)
                        draggedItem = draggedItem == nil ? item : nil
                        
                        return NSItemProvider(object: String(item) as NSString)
                    }
                    .onDrop(
                        of: [.text],
                        delegate: DragAndDropViewDropDelegate(item: item, draggedItem: $draggedItem, targetItem: $targetItem, items: $items)
                    )
                    .sensoryFeedback(.warning, trigger: draggedItem)
                    .scaleEffect(draggedItem == item ? 0.8 : targetItem == item ? 1.1 : 1)
            }
        }
        .padding()
        .background(Color.gray, in: RoundedRectangle(cornerRadius: 10))
    }
    
}

struct DragAndDropViewDropDelegate: DropDelegate {
    
    //Target item
    let item: Int
    
    //Dragged item
    @Binding var draggedItem: Int?
    
    //Target item
    @Binding var targetItem: Int?
    
    //Array items
    @Binding var items: [Int]
    
    func dropEntered(info: DropInfo) {
        guard let draggedItem = draggedItem, draggedItem != item else { return }
        
        targetItem = item
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func performDrop(info: DropInfo) -> Bool {
        
        guard let draggedItem = draggedItem, draggedItem != item else { return false }
        
        // Find the indices of the dragged item and the target item
        guard let fromIndex = items.firstIndex(where: { $0 == draggedItem }),
              let toIndex = items.firstIndex(where: { $0 == item }),
              fromIndex != toIndex else { return false }
        
        //Swap the items in the array
        withAnimation {
            items.swapAt(fromIndex, toIndex)
        }
        
        targetItem = nil
        return true
    }
}

//Preview
struct DragAndDropView_Previews: PreviewProvider {
    static var previews: some View {
        DragAndDropView()
    }
}
