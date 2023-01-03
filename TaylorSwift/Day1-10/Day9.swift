func greetUser() {
	print("Hi there")
}

// pass functions into functions
greetUser()
var greetCopy = greetUser
greetCopy()


// function inside a variable 
let sayHello = {
	print("Hi, there!")
}

sayHello()

// accepts a string and returns a string 
// in marks the start of the closure
let sayhello = { (name: String) -> String in 
	"Hi \(name)!"
}

print(sayhello("Yongye"))


// very explict type 
// the greetUser accepts no parameter and returns nothing 
var greetCopyCopy: () -> Void = greetUser
greetCopyCopy()

func getUserData(for id: Int) -> String {
	if id == 1989 {
		return "Taylor Swift"
	} else {
		return "Anonymous"
	}
}

// let name: (data type in the parameter) -> return type
let data: (Int) -> String = getUserData
let user = data(1989)
print(user)


let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)


// control the sort, making Suzanne be always the first item

func captainFirstSorted(name1: String, name2: String) -> Bool {

	if name1 == "Suzanne" {
		return true
	} else if name2 == "Suzanne" {
		return false
	}
	return name1 < name2

}
// pass a function inside a function
let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

// write that in closure

let captainFirstFirst = team.sorted(by: { (name1: String, name2: String) -> Bool in 
	if name1 == "Suzanne" {
		return true
	} else if name2 == "Suzanne" {
		return false
	}
	return name1 < name2
})


let payment = { (user: String ) in 
	print("Paying \(user)...")
}

payment("Tina")

// return a boolean value
let payment2 = { (user: String) -> Bool in
    print("Paying \(user)…")
    return true
}
print(payment2("Jack"))

let payment3 = { () -> Bool in
	print("paying some strangers")
	return true

}
print(payment3())



//  Trailing closure nad shorthand syntax
// no need to specify the parameter types and the return type 
let captainShortHand = team.sorted(by: { name1, name2 in 
	if name1 == "Suzanne" {
		return true
	} else if name2 == "Suzanne" {
		return false
	}
	return name1 < name2
})

// trailing closure
let captainTrailing = team.sorted { name1, name2 in 
	if name1 == "Suzanne" {
		return true
	} else if name2 == "Suzanne" {
		return false
	}
	return name1 < name2
}

// less clear syntax 
let captainLessClearSyntax = team.sorted {
	if $0 == "Suzanne" {
		return true
	} else if $1 == "Suzanne" {
		return false
	}
	return $0 < $1
}

// no need to specify the word "return "
let reverseTeam = team.sorted { $0 > $1 }
print(reverseTeam)

// select the item with the capitalized "T" 
let tonly = team.filter { $0.hasPrefix("T")}
print(tonly)

// making all the strings to uppercase string
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)


// accept functions as parameters
var goOnBike = {
	print("I'll take my bicycle.")
}
func race(using vehicleType: () -> Void) {
	print("Let's race!")
	vehicleType()
}




