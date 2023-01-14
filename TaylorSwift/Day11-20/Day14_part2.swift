let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

// if Serenity does not exist, it is stored as N/A
let new = captains["Serenity"] ?? "N/A"
// let new = captains["Serenity", default: "N/A"]
print(new)

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"
print(favorite)

struct Book {
    let title: String
    let author: String?
}

// ?? is like if the variable is optional and it is nil then give it a default value
let book = Book(title: "ABC", author: nil)
let author = book.author ?? "Annoymous"
print(author)



let names = ["Arya", "Bran", "Robb", "Sansa"]
// it is saying that randomElement is optional, could be there or could not be there
// if there is there, then uppercased, if there is not there, default would be "No one"
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

struct Book2 {
    let title: String
    let author: String?
}

var bookbook: Book2? = nil
// bookbook is optional, author is optional, first could be there, if it is there, then uppercase, otherwise "A"
let author2 = bookbook?.author?.first?.uppercased() ?? "A"
print(author2)


// How to handle function failure with optionals
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
} 

// if it works
if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user2 = (try? getUser(id: 23)) ?? "Annoymous"
print(user2)