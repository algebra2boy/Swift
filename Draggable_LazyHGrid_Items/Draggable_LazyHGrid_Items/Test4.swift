//
//  Test4.swift
//  Draggable_LazyHGrid_Items
//
//  Created by Yongye Tan on 1/27/25.
//

import SwiftUI

// Reference: https://stackoverflow.com/questions/62606907/swiftui-using-ondrag-and-ondrop-to-reorder-items-within-one-single-lazygrid
struct InspectorSidebarToolbarTop: View {
    
    @State var targeted: Bool = true
    @State private var icons = [
        InspectorDockIcon(imageName: "doc", title: "File Inspector", id: 0),
        InspectorDockIcon(imageName: "clock", title: "History Inspector", id: 1),
        InspectorDockIcon(imageName: "questionmark.circle", title: "Quick Help Inspector", id: 2),
        InspectorDockIcon(imageName: "apple.logo", title: "Quick Help Inspector", id: 3),
        InspectorDockIcon(imageName: "book", title: "Quick Help Inspector", id: 4),
        InspectorDockIcon(imageName: "square.and.arrow.up", title: "Quick Help Inspector", id: 5),
        InspectorDockIcon(imageName: "highlighter", title: "Quick Help Inspector", id: 6),
        InspectorDockIcon(imageName: "trash", title: "Quick Help Inspector", id: 7),
        InspectorDockIcon(imageName: "folder.fill", title: "Quick Help Inspector", id: 8),
        InspectorDockIcon(imageName: "paperplane", title: "Quick Help Inspector", id: 9),
        InspectorDockIcon(imageName: "document", title: "Quick Help Inspector", id: 10),
        InspectorDockIcon(imageName: "wallet.pass", title: "Quick Help Inspector", id: 11),
        InspectorDockIcon(imageName: "wallet.bifold", title: "Quick Help Inspector", id: 12),
        InspectorDockIcon(imageName: "circle.square", title: "Quick Help Inspector", id: 13),
        InspectorDockIcon(imageName: "flag.pattern.checkered.circle.fill", title: "Quick Help Inspector", id: 14),
        InspectorDockIcon(imageName: "house", title: "Quick Help Inspector", id: 15),
        InspectorDockIcon(imageName: "figure.walk", title: "Quick Help Inspector", id: 16),
    ]
    
    @State private var hasChangedLocation: Bool = false
    @State private var draggingItem: InspectorDockIcon?
    @State private var drugItemLocation: CGPoint?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(icons) { icon in
                    makeInspectorIcon(systemImage: icon.imageName, title: icon.title, id: icon.id)
                        .opacity(draggingItem?.imageName == icon.imageName &&
                                 hasChangedLocation &&
                                 drugItemLocation != nil ? 0.0: 1.0)
                        .onDrop(of: [.utf8PlainText],
                                delegate: InspectorSidebarDockIconDelegate(item: icon,
                                                                           current: $draggingItem,
                                                                           icons: $icons,
                                                                           hasChangedLocation: $hasChangedLocation,
                                                                           drugItemLocation: $drugItemLocation))
                }
            }
            .frame(height: 40, alignment: .center)
            .frame(maxWidth: .infinity)
            .overlay(alignment: .top) {
                Divider()
            }
            .overlay(alignment: .bottom) {
                Divider()
            }
            .animation(.default, value: icons)
        }
        .frame(height: 40, alignment: .center)
        .frame(maxWidth: .infinity)
    }
    
    func makeInspectorIcon(systemImage: String, title: String, id: Int) -> some View {
        Button {
        } label: {
            Image(systemName: systemImage)
                .help(title)
                .frame(width: 20, alignment: .center)
                .onDrag {
                    if let index = icons.firstIndex(where: { $0.imageName == systemImage }) {
                        draggingItem = icons[index]
                    }
                    return .init(object: NSString(string: systemImage))
                } preview: {
                    RoundedRectangle(cornerRadius: .zero)
                        .frame(width: .zero)
                }
        }
        .buttonStyle(.plain)
    }
    
    private struct InspectorDockIcon: Identifiable, Equatable {
        let imageName: String
        let title: String
        var id: Int
    }
    
    private struct InspectorSidebarDockIconDelegate: DropDelegate {
        let item: InspectorDockIcon
        @Binding var current: InspectorDockIcon?
        @Binding var icons: [InspectorDockIcon]
        @Binding var hasChangedLocation: Bool
        @Binding var drugItemLocation: CGPoint?
        
        func dropEntered(info: DropInfo) {
            if current == nil {
                current = item
                drugItemLocation = info.location
            }
            
            guard item != current, let current = current,
                  let from = icons.firstIndex(of: current),
                  let toIndex = icons.firstIndex(of: item) else { return }
            
            hasChangedLocation = true
            drugItemLocation = info.location
            
            if icons[toIndex] != current {
                icons.move(fromOffsets: IndexSet(integer: from), toOffset: toIndex > from ? toIndex + 1 : toIndex)
            }
        }
        
        func dropExited(info: DropInfo) {
            drugItemLocation = nil
        }
        
        func dropUpdated(info: DropInfo) -> DropProposal? {
            return DropProposal(operation: .move)
        }
        
        func performDrop(info: DropInfo) -> Bool {
            hasChangedLocation = false
            drugItemLocation = nil
            current = nil
            return true
        }
    }
}

#Preview {
    InspectorSidebarToolbarTop()
}
