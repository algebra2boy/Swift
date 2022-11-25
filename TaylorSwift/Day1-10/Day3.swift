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


let person = [
	"place": "boston",
	"city": "Malden",
	"sex": "male"
]

print(person)
print(person["place"])
print(person["city"])
print(person["sex"])

// “this data might not actually be there – are you sure you want to print it?”
// provide a default value to use if the key doesn’t exist.
print(person["place", default: "Unknown"]) 
print(person["city" , default: "Unknown"])
print(person["sex" , default: "Unknown"])

print(person["apple"]) // return nil because key does not exist
print(person["apple", default: "Unknown"]) // since it does not exist, it will choose the default


// create an empty dictionary 
// key as String and Int as value
var heights = [String : Int] ()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206



// making a set 
let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
print(people) // each time the output is different after printing out

var people2 = Set<String>()
people2.insert("Denzel Washington")
people2.insert("Tom Cruise")
people2.insert("Nicolas Cage")
people2.insert("Samuel L Jackson")
print(people2)

// enum is like switch case 
// very convinent 
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

"""
shorter way to write enum
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}
"""

var day = Weekday.monday
print(day) // "monday"
day = Weekday.tuesday
print(day) // "tuesday"
day = .friday  // because var already refers to Weekday, so we do not need to specify it again
print(day)





