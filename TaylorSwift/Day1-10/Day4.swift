// Swift predicts the type
let surname = "Lasso"
var score = 0

// very explict type
let name : String = "Yong"
let score1 : Int = 0

// String holds text
let playerName: String = "Roy"

// Int holds whole number 
var luckyNumber: Int = 13

// Double holds decimal number
let pi: Double = 3.141

// Bool holds either true or false value
var isAuthenticated: Bool = true

// Array holds lots of different values with the same type
var albums: [String] = ["RED"]
print(albums)

// Dictionary stores key-value items
var user: [String: String] = ["id": "@twostraws"]

// Set is very fast, store them in an other that's optimized
var books : Set<String> = Set(["Apple pie", "banana cake"])
print(books)

// very explict type for String array
var teams : [String] = [String]()
var teams1 : [String] = Array<String>()
var teams2 : Array<String> = Array<String>()
var teams3 : Array<String> = [String]()

teams2.append("Messi")
print(teams2)

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
print(style)
style = .dark
print(style)




