let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

// compared alphabetically
if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}
// Make an array of 3 numbers
var numbers = [1, 2, 3]

// Add a 4th
numbers.append(4)

// If we have over 3 items
if numbers.count > 3 {
    // Remove the oldest number
    numbers.remove(at: 0)
}

// Display the result
print(numbers)

// Create the username variable
var username = "taylorswift13"

// If `username` contains an empty string
if username == "" {
    // Make it equal to "Anonymous"
    username = "Anonymous"
}

// Now print a welcome message
print("Welcome, \(username)!")

// this is a much faster way, because .count would neeed check every letter of the string
if username.isEmpty {
    username = "Anonymous"
}


let today = "Monday"
if today == "Monday" {
    print("Man, i hate monday")
}else if today == "Tuesday" {
    print("getting there")
}else {
    print("Let's goo!")
}

var my_age = 18, height = 210

if my_age < 21 && height > 180 {
    print("Very young and tall man ")
}

if my_age > 21 || height > 180 {
    print("Nice")
}

enum Weather {
    case sun, rain, wind, snow, unknown
}

// must declare the type to use the cases
let forecast = Weather.sun

// if-else is not very convinent 
if forecast == .sun {
     print("It should be a nice day.")
}else if forecast == .rain {
    print("Pack an umbrella.")
} else if forecast == .wind {
    print("Wear something warm")
} else if forecast == .rain {
    print("School is cancelled.")
} else {
    print("Our forecast generator is broken!")
}


// switch case is like once you find the target, it returns immediately
// and it does not go down anymore

// if we use enum and switch case, it must cover all the possible cases in enum
switch forecast {
case .sun :
     print("It should be a nice day.")
case .rain :
    print("Pack an umbrella.")
case .wind :
    print("Wear something warm")
case .snow :
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}


let girl : String = "tina"

switch girl {
case "tina":
    print("hi, tina")
case "xinyi":
    print("xinyi is beautiful")
// we should always add default vaule
default:
    print("it is my wife")
}

let day = 5
print("My true love gave to me…")

// fallthrough will keep going down the case
// fallthrough can be used more than once
switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}


// tenary (very important)
var miko_age = 20
var age_test = miko_age > 18 ? "I am older than 18" : "I am younger than 18"
print(age_test)

enum Theme {
    case light, dark
}

let theme = Theme.dark
let backgroudn = (theme == .dark) ? "It is dark" :  "it is light"
print(backgroudn)


