//
//  CoreDataCloudKitDemo.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 1/2/24.
//

import SwiftUI

struct CoreDataCloudKitDemo: View {
    
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        CoreDataCloudKitView()
            .environment(\.managedObjectContext,
                          persistenceController.container.viewContext
            )
    }
}

struct CoreDataCloudKitView: View {
    
    @State private var name: String = ""
    @State private var quantity: String = ""
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // sort the name in alphabetical order
    @FetchRequest(entity: Product.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    private var products: FetchedResults<Product>
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Product name", text: $name)
                TextField("Product quantity", text: $quantity)
                
                HStack {
                    Spacer()
                    
                    Button(action: addProduct) {
                        Text("Add")
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        ResultsView(name: name, viewContext: viewContext)
                    } label: {
                        Text("Find")
                    }
                    
                    Spacer()
                    
                    Button("Clear") {
                        clearField()
                    }
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                List {
                    ForEach(products) { product in
                        HStack {
                            Text(product.name ?? "Not found")
                            Spacer()
                            Text(product.quantity ?? "Not found")
                        }
                    }
                    .onDelete(perform: deleteProducts)
                }
                
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            .navigationTitle("Product Database")
        }
    }
    
    private func clearField() {
        name = ""
        quantity = ""
    }
    
    private func addProduct() {
        withAnimation {
            let product = Product(context: viewContext)
            product.name = name
            product.quantity = quantity
            
            saveContext()
            clearField()
        }
    }
    
    private func deleteProducts(offsets: IndexSet) {
        withAnimation {
            offsets.map { products[$0] }.forEach(viewContext.delete)
            saveContext()
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("An error occurred: \(error)")
        }
    }
    
}

#Preview {
    CoreDataCloudKitDemo()
}
