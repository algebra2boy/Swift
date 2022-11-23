var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

print(beatles)
print(numbers)
print(temperatures)

print(beatles[0])
print(numbers[1])
print(temperatures[2])

// only append to the same type 
// temperature stores double, but chris is a string variable
// temperatures.append("Chris")

let firstBeatle = beatles[0]
let firstNumber = numbers[0]

// cannot do this unless the same type
//let notAllowed = firstBeatle + firstNumber

// very specific type
var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

var score1 = [Int]()
score1.append(100)
score1.append(80)
score1.append(85)
print(score1)


// Array<Int>() is same as [Int]()