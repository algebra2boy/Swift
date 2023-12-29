//
//  ListNavDemo.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 12/28/23.
//

import SwiftUI

struct ListNavDemo: View {
    
    @State var groceryStore: GroceryStore = GroceryStore()
    @State private var stackPath = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $stackPath) {
            List {
                ForEach(groceryStore.fruits) { fruit in
                    // List view must also be embedded in a NavigationStack when
                    // nav link is used
                    NavigationLink(value: fruit) {
                        ListCell(fruit: fruit)
                    }
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationDestination(for: Fruit.self) { fruit in
                FruitDetailView(selectedFruit: fruit)
            }
            .navigationDestination(for: String.self) { _ in
                AddNewFruitView(groceryStore: groceryStore, path: $stackPath)
            }
            .navigationTitle("Fruit Store")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(value: "Add Fruit") {
                        Text("Add")
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        groceryStore.fruits.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        groceryStore.fruits.move(fromOffsets: source, toOffset: destination)
    }
}

struct ListCell: View {
    
    var fruit: Fruit
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(fruit.name)
                .font(.title)
            Text(fruit.desc)
                .font(.subheadline)
        }
    }
}

struct FruitDetailView: View {
    
    let selectedFruit: Fruit
    
    var body: some View {
        
        Form {
            Section(header: Text("Car Details")) {
                
                HStack {
                    Text("name:")
                    Text(selectedFruit.name)
                        .font(.headline)
                }
                
                HStack {
                    Text("description:")
                    Text(selectedFruit.desc)
                        .font(.body)
                }
                
                HStack {
                    Text("isClean").font(.headline)
                    Spacer()
                    Image(systemName: selectedFruit.isClean ?
                          "checkmark.circle" : "xmark.circle" )
                    
                }
            }
        }
        
    }
}

struct AddNewFruitView: View {
    
    @Bindable var groceryStore: GroceryStore
    @State private var isClean: Bool = false
    @State private var name: String = ""
    @State private var description: String = ""
    
    @Binding var path: NavigationPath
    
    var body: some View {
        
        Form {
            Section(header: Text("Fruit Details")) {
                DataInput(title: "Name", userInput: $name)
                DataInput(title: "Description", userInput: $description)
            }
            Toggle(isOn: $isClean) {
                Text("IsClean").font(.headline)
            }
            .padding()
        }
        
        Button(action: addNewFruit) {
            Text("Add Fruit")
        }
        
    }
    
    func addNewFruit() {
        let newFruit: Fruit = .init(
            name: name,
            desc: description,
            isClean: isClean)
        groceryStore.fruits.append(newFruit)
        path.removeLast()
    }
    
}

struct DataInput: View {
    
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
    
}


struct Fruit: Hashable, Codable, Identifiable {
    
    var id: UUID
    var name: String
    var desc: String
    var isClean: Bool
    
    init(id: UUID = UUID(), name: String, desc: String, isClean: Bool) {
        self.id = id
        self.name = name
        self.desc = desc
        self.isClean = isClean
    }
}

@Observable class GroceryStore {
    
    var fruits: [Fruit] = [
        .init(name: "apple", desc: "big apple", isClean: true),
        .init(name: "banana", desc: "yellow banan", isClean: true),
        .init(name: "pineapple", desc: "small pineapple", isClean: true)
    ]
    
    public init() { }
}

#Preview("ListNavDemo") {
    ListNavDemo()
}

#Preview("FruitDetailView") {
    FruitDetailView(selectedFruit: GroceryStore().fruits.first!)
}
