//
//  ContentView.swift
//  Draggable_LazyHGrid_Items
//
//  Created by Yongye Tan on 1/26/25.
//

import SwiftUI

// MARK: - Protocol for Reorderable Items
public typealias Reorderable = Identifiable & Equatable

struct GridData: Reorderable {
    let id: Int
}

// MARK: - ReorderableForEach
public struct ReorderableForEach<Item: Reorderable, Content: View, Preview: View>: View {
    @Binding private var active: Item?
    @State private var hasChangedLocation = false
    
    private let items: [Item]
    private let content: (Item) -> Content
    private let preview: ((Item) -> Preview)?
    private let moveAction: (IndexSet, Int) -> Void
    
    public init(
        _ items: [Item],
        active: Binding<Item?>,
        @ViewBuilder content: @escaping (Item) -> Content,
        @ViewBuilder preview: @escaping (Item) -> Preview,
        moveAction: @escaping (IndexSet, Int) -> Void
    ) {
        self.items = items
        self._active = active
        self.content = content
        self.preview = preview
        self.moveAction = moveAction
    }
    
    public init(
        _ items: [Item],
        active: Binding<Item?>,
        @ViewBuilder content: @escaping (Item) -> Content,
        moveAction: @escaping (IndexSet, Int) -> Void
    ) where Preview == EmptyView {
        self.items = items
        self._active = active
        self.content = content
        self.preview = nil
        self.moveAction = moveAction
    }
    
    public var body: some View {
        ForEach(items) { item in
            if let preview {
                contentView(for: item)
                    .onDrag {
                        dragData(for: item)
                    } preview: {
                        preview(item)
                    }
            } else {
                contentView(for: item)
                    .onDrag {
                        dragData(for: item)
                    }
            }
        }
    }
    
    private func contentView(for item: Item) -> some View {
        content(item)
            .opacity(active == item && hasChangedLocation ? 0.5 : 1)
            .onDrop(
                of: [.text],
                delegate: ReorderableDragRelocateDelegate(
                    item: item,
                    items: items,
                    active: $active,
                    hasChangedLocation: $hasChangedLocation
                ) { from, to in
                    withAnimation {
                        moveAction(from, to)
                    }
                }
            )
    }
    
    private func dragData(for item: Item) -> NSItemProvider {
        active = item
        return NSItemProvider(object: "\(item.id)" as NSString)
    }
}

// MARK: - Drag Relocate Delegate
struct ReorderableDragRelocateDelegate<Item: Reorderable>: DropDelegate {
    let item: Item
    var items: [Item]
    @Binding var active: Item?
    @Binding var hasChangedLocation: Bool
    var moveAction: (IndexSet, Int) -> Void
    
    func dropEntered(info: DropInfo) {
        guard item != active, let current = active else { return }
        guard let from = items.firstIndex(of: current) else { return }
        guard let to = items.firstIndex(of: item) else { return }
        hasChangedLocation = true
        if items[to] != current {
            moveAction(IndexSet(integer: from), to > from ? to + 1 : to)
        }
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        DropProposal(operation: .move)
    }
    
    func performDrop(info: DropInfo) -> Bool {
        hasChangedLocation = false
        active = nil
        return true
    }
}

// MARK: - Drop Outside Delegate
struct ReorderableDropOutsideDelegate<Item: Reorderable>: DropDelegate {
    @Binding var active: Item?
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        DropProposal(operation: .move)
    }
    
    func performDrop(info: DropInfo) -> Bool {
        active = nil
        return true
    }
}

// MARK: - View Extension
public extension View {
    func reorderableForEachContainer<Item: Reorderable>(
        active: Binding<Item?>
    ) -> some View {
        onDrop(of: [.text], delegate: ReorderableDropOutsideDelegate(active: active))
    }
}

// MARK: - ContentView Example
struct DraggableLazyVGridView: View {
    @State private var items = (1...20).map { GridData(id: $0) }
    @State private var active: GridData?
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ReorderableForEach(items, active: $active) { item in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue.opacity(0.6))
                        .frame(height: 80)
                        .overlay(Text("\(item.id)").foregroundColor(.white))
                } preview: { item in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue)
                        .frame(height: 100)
//                        .overlay(Text("Dragging \(item.id)").foregroundColor(.white))
                } moveAction: { from, to in
                    items.move(fromOffsets: from, toOffset: to)
                }
            }
            .padding()
        }
        .reorderableForEachContainer(active: $active)
    }
}

struct DraggableLazyHGridView: View {
    @State private var items = (1...20).map { GridData(id: $0) }
    @State private var active: GridData?
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.fixed(100))]) {
                ReorderableForEach(items, active: $active) { item in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.green.opacity(0.6))
                        .frame(width: 100)
                        .overlay(Text("\(item.id)").foregroundColor(.white))
                } preview: { item in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.green)
                        .frame(width: 120)
//                        .overlay(Text("Dragging \(item.id)").foregroundColor(.white))
                } moveAction: { from, to in
                    items.move(fromOffsets: from, toOffset: to)
                }
            }
            .padding()
        }
        .reorderableForEachContainer(active: $active)
        .background(Color.gray.opacity(0.1))
    }
}

#Preview("lazyVGrid") {
    DraggableLazyVGridView()
}

#Preview("lazyHGrid") {
    DraggableLazyHGridView()
}
