//
//  ContentView.swift
//  BookWorm
//
//  Created by Yongye Tan on 7/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    // sort by title and author
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title, order: .reverse),
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown title")
                                    .font(.headline)
                                
                                Text(book.author ?? "Unknown author")
                                    .foregroundStyle(.secondary)
                                    .foregroundStyle(book.rating == 1 ? .red: .white )
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // attach the sheet to the toolbar
                        // because that is the behavior wewanted
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add book", systemImage:"plus")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    // Build-in button from SwiftUI
                    // only works if onDelete modifier is attached
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            
            // find this book in our fetch
            let book = books[offset]
            
            // delete it from the context
            viewContext.delete(book)
        }
        
        do {
            try viewContext.save()
        } catch {
            print("something went wrong deleting")
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
