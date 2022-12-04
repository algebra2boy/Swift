func addition (number1 : Int,  number2 : Int) {
	print("\(number1) + \(number2) = \(number1+number2)")
}

// addition(1,2) // this would not work
addition(number1 : 1,number2: 2)
addition(number1 : 3,number2: 7)

func rollDice() -> Int {
	return Int.random(in: 1...6)
}

var number = rollDice()
print(number)

func stringBreakDown(str_list : String) -> [Character] {
	var string_list : Array<Character> = Array<Character>()

	for letter in str_list {
		string_list.append(letter)
	}

	return string_list
} 

var list = stringBreakDown(str_list: "abcd")
print(list)

func isUppercase(string: String) -> Bool {
	return string == string.uppercased()
}

print(isUppercase(string: "ABC"))
print(isUppercase(string: "aBC"))

func getClass() -> [String] {
	return ["Math", "CS", "History "]
}

let classItake = getClass()
for c in 0..<classItake.count {
	print("Class \(c) is \(classItake[c])")
}

func getCLassAndProfessor() -> [String:String] {
	return ["Math": "Eric",
	 "CS" : "Marius",
	 "History" : "Fresch"]
}

let cp = getCLassAndProfessor()

for (c, professor) in cp {
	print("professor \(professor) teaches \(c)")
}


func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

// object then call the field
let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")
print("Name: \(user.0) \(user.1)")

// tuple notation 
let (firstName, lastName) = getUser()
print("Name: \(user.firstName) \(user.lastName)")

// only want part of the user 
let (First, _) = getUser()
print("Name: \(First)")

