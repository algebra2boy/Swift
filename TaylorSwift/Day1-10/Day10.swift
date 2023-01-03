
// a type must start a cap at the beginning
struct Album {

	let title: String
	let artist: String
	let year: Int


	func printSummary() {
		print("\(title) (\(year)) by \(artist)")
	}

}
let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)


// if we create an employee as a constant using let, Swift
// makes the employee and all its data constant
struct Employee {
    let name: String
    var vacationRemaining: Int

    // when we want to modify the var variable inside a struct, we must using the key word "mutating"
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)



struct Employee2 {

	// if we regularly read the property when its value hasn't changed, then use a stored property 
    let name: String
    var vacationAllocated: Int = 14
    var vacationTaken = 0

    // computed property is used when property is read very rarely
    var vacationRemaning: Int {
    	// getter
    	get {
    		return vacationAllocated - vacationTaken
    	}

    	// setter 
    	set {

    		vacationAllocated = vacationTaken + newValue
    	}
    }

}

var emp = Employee2(name: "Yongye")
print(emp.vacationRemaning)
emp.vacationAllocated = 20
emp.vacationTaken = 5
print(emp.vacationRemaning)
// this use the setting (100 + 5 = 105)
emp.vacationRemaning = 100
print(emp.vacationAllocated)



struct Game {
	var score = 0 {
		// property observer, special pieces of code that run when the property changes
		didSet {
			print("Score is now \(score)")
		}
	}
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contacts = [String]() {
        willSet {
        	// willSet observer to run before the property changed.
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

struct Player {

	let name: String
	let number: Int

	init(name: String, number: Int) {
		self.name = name
		self.number = number
	}


}

let player = Player(name: "Yongye", number: 4)
print(player.name)
// print(player.number)

