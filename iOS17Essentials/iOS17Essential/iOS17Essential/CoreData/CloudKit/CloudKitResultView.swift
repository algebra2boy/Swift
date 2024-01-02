//
//  CloudKitResultView.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 1/2/24.
//

import SwiftUI
import CoreData

struct CloudKitResultView: View {
    
    var name: String
    var viewContext: NSManagedObjectContext
    @State var matches: [Product]?
        
    var body: some View {
        VStack {
            List {
                ForEach(matches ?? []) { match in
                    HStack {
                        Text(match.name ?? "Not found")
                        Spacer()
                        Text(match.quantity ?? "Not found")
                    }
                }
                
            }
            .navigationTitle("Results")
        }
        .task {
            let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
            
            fetchRequest.entity = Product.entity()
            fetchRequest.predicate = NSPredicate(
                format: "name CONTAINS %@", name
            )
            
            matches = try? viewContext.fetch(fetchRequest)
        }
    }
}

#Preview {
    CloudKitResultView(name: "apple", viewContext: CloudKitPersistence.shared.container.viewContext)
}
