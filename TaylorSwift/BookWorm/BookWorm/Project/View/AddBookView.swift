//
//  AddBookView.swift
//  BookWorm
//
//  Created by Yongye Tan on 7/3/23.
//

import SwiftUI

struct AddBookView: View {
    // Environment
    @Environment(\.managedObjectContext) var viewContext
    
    @Environment(\.dismiss) var dismiss
    
    // internal
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery",
                  "Poetry", "Romance", "Thriller"]
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of the book", text: $title)
                    
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                }
                
                Section {
                    
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                    
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    
                    Button("Save") {
                        let newBook = Book(context: viewContext)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        // core data only accespts Int 16, 32, 64
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        
                        do {
                            try viewContext.save()
                        } catch {
                            print("an error has occurred when saving data")
                        }
                        
                        dismiss()
                        
                    }
                    .disabled(title.isEmpty || author.isEmpty || review.isEmpty)
                }
                
            }
            .navigationTitle("Add book")
        }
        
        Circle()
            .foregroundStyle(.black.opacity(0.1))
            .frame(width: 50)
            .overlay {
                Image(systemName: "apple.logo")
            }
    }
}

#Preview {
    AddBookView()
}
