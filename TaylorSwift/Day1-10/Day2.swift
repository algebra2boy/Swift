let filename = "file1.jpg"
print(filename.hasSuffix(".jpg")) // true

let my_turn = false
if (my_turn) {
	print("it is my turn")
}
else{
	print("it is not my turn")
}

let firstPart = "I love"
let secondPart = "Swift"
let sentence = firstPart + " " + secondPart
print(sentence)

var number =  "apple" + "1" + "2" + "3"
print(number)


// we are not using + sign to concat the strings
// string interpolation
print("HEllo, \(firstPart), \(secondPart)")

// don't put numbers like this, complier is unable to type-check the expression
// let number =  1 + 2 + "apple" + "1" + "2" + "3"

// we have to cast to a string before concating to the sentence 
number =  String(1 + 2) + "apple" + "1" + "2" + "3"
print(number)
