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