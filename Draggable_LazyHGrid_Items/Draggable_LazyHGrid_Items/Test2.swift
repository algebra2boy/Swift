//
//  Test2.swift
//  Draggable_LazyHGrid_Items
//
//  Created by Yongye Tan on 1/27/25.
//

import SwiftUI
import UniformTypeIdentifiers

@available(iOS 13.0.0, *)
struct Test2View: View {
    
    @State var items = ["1", "2", "3"]
    @State var draggedItem : String?
    
    var body: some View {
        LazyVStack(spacing : 15) {
            ForEach(items, id:\.self) { item in
                Text(item)
                    .frame(minWidth:0, maxWidth:.infinity, minHeight:50)
                    .border(Color.black).background(Color.red)
                    .onDrag({
                    self.draggedItem = item
                    return NSItemProvider(item: nil, typeIdentifier: item)
                }) .onDrop(of: [UTType.text], delegate: MyDropDelegate(item: item, items: $items, draggedItem: $draggedItem))
            }
        }
    }
}

struct MyDropDelegate : DropDelegate {

    let item : String
    @Binding var items : [String]
    @Binding var draggedItem : String?

    func performDrop(info: DropInfo) -> Bool {
        return true
    }

    func dropEntered(info: DropInfo) {
        guard let draggedItem = self.draggedItem else {
            return
        }

        if draggedItem != item {
            let from = items.firstIndex(of: draggedItem)!
            let to = items.firstIndex(of: item)!
            withAnimation(.default) {
                self.items.move(fromOffsets: IndexSet(integer: from), toOffset: to > from ? to + 1 : to)
            }
        }
    }
}

#Preview {
    Test2View()
}
