func getComputername(_ name : String) -> String{
	return name
}

// no need to provide another paramter name
var name = getComputername("HP")
print(name)


func getDay(day : String) -> String{
	return day
}

// need to provide another paramter name when no underscope is provided 
var day = getDay(day: "Monday")
print(day)


// providing external parameter names
func calculateNumbers(number1 a : Int, number2 b : Int) -> Int {
	return a * b 
}

let num = calculateNumbers(number1: 5, number2 : 10)
print(num)