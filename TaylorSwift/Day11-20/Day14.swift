let opposite: [String : String] = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

// this makes sure that there is value inside
if let peachOpposite = opposite["Mario"] {
    print(peachOpposite)
}

var username: String? = nil

// open the box and check if there is a value
if let unwrappedName = username {
    print("we got a user \(unwrappedName)")
} else {
    print("The optional was empty.")
}

func square(number: Int) -> Int {
    return number * number 
}

var number: Int? = nil

// if let unwrappedNumber = number {
//     print(square(number: unwrappedNumber))
// }

// this is allowed too
if let number = number {
    print(square(number: number))
}



// Swift requires you to use return if a guard check fails.
// If the optional you're unwrapping has value, you can use it after the guard code finishes

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing output")
        // return
    }
    print("\(number) x \(number) is \(number * number)")
}

printSquare(of: nil) // "Missing output"
printSquare(of: 5)

var myVar: Int? = 3

if let unwrapped = myVar {
    // RUn if myVar has a value inside 
}

guard let unwrapped = myVar else {
    // Run if myVar doesn't have a value inside 
}