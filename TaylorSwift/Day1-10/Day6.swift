let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

// for each loop 
for os in platforms {
	print("Swift works great on \(os)")
}

// for loop with numbers 
// 1 and 12 is inclusive 
for i in 1...12 {
	print("5 x \(i) is \(5 * i)")
}

// 1 up to 5, not including 5 
for i in 1..<5{
	print("printing \(i)")
}

var people = ["Anan", "Jeff"]
for _ in people{
	print("printing ")}

var number  = 10

while (number >= 0) {
	print(number)
	number -= 1
}

let id : Int = Int.random(in: 1...1000)
print(id)

var roll = 0

while roll != 10 {
	roll = Int.random(in: 1...20)
	print("I rolled a \(roll)")
}

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}


let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)


