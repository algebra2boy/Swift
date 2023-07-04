//
//  DetailView.swift
//  BookWorm
//
//  Created by Yongye Tan on 7/4/23.
//

import SwiftUI
import CoreData

struct DetailView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasay")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "Fantasy")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author ?? "Unknown Author")
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review ?? "No review")
                .padding()
            
            // add .constant make the integer to a binding variable
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unknown book")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete Book?", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showingDeleteAlert.toggle()
                } label: {
                    Label("Delete this book ", systemImage: "trash")
                }
            }
        }
    }
    
    func deleteBook() {
        viewContext.delete(book)
        
        do {
            try viewContext.save()
        } catch {
            print("something is wrong with deleting the book")
        }
        
        dismiss()
    }
}


//struct DetailView_Previews: PreviewProvider {
//    
//    static let viewContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//    static var previews: some View {
//        let book = Book(context: viewContext)
//        book.title = "Title book"
//        book.author = "Test author"
//        book.genre = "Fantasy"
//        book.rating = 4
//        book.review = "I love it"
//        return NavigationStack {
//            DetailView(book: book)
//        }
//    }
//}
