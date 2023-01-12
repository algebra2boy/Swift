/*

classes differ from structs in five key places:
1. You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.
2. Because of that first point, Swift won’t automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
3. When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
4. When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.
5. Even if you make a class constant, you can still change its properties as long as they are variables.


*/

/*
Difference between class and struct
1. Classes do not come with synthesized memberwise initializers.
2. One class can be built upon (“inherit from”) another class, gaining its properties and methods.
3. Copies of structs are always unique, whereas copies of classes actually point to the same shared data.
4. Classes have deinitializers, which are methods that are called when an instance of the class is destroyed, but structs do not.
5. Variable properties in constant classes can be modified freely, but variable properties in constant structs cannot.


*/


class Game {

	var score: Int = 0 {
		didSet {
			print("Score is now \(score)")
		}
	}
}

var gg = Game()
gg.score += 10


// superclass
class Employee {
	let hours: Int

	init(hours: Int) {
		self.hours = hours
	}

	func printSummary() {
    	print("I work \(hours) hours a day.")
	}
}

final class Developer: Employee {
	func work() {
		print("I am writting code for \(hours) hours.")
	}
	// using the keyword "override"
	override func printSummary() {
    	print("I am so sick of writing C++ code, I love Swift and Python.")
	}

}

final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

// since Developer inherite from Employee, it also inherits the init
var developer1 = Developer(hours: 5)
developer1.work()
developer1.printSummary()

var emp1 = Employee(hours: 6)
emp1.printSummary()


// Final classes are ones that cannot be inherited from, which means it’s not possible for users of your code to add functionality or change what they have
/* This is not allowed because Developer class is already "final"
class Intern: Developer {
	func work() {
		print("I am writting code for \(hours) hours.")
	}

}
*/


class Vehicle {
	let isElectric: Bool

	init(isElectric: Bool) {
		self.isElectric = isElectric
	}

}


class Car: Vehicle {
	let isConvertible: Bool

	init(isElectric: Bool, isConvertible: Bool) {
		self.isConvertible = isConvertible
		// calling the parent class 
		super.init(isElectric: isElectric)
	}

}

let teslaX = Car(isElectric: true, isConvertible: false)
print(teslaX.isElectric)
print(teslaX.isConvertible)


// all copies of a class instance share the same data


class User {
	var username = "Unknown name"

	// make a unique copy
	func copy() -> User {
		let user = User()
		user.username = username
		return user
	}
}


var user1: User = User()
var user2 = user1
print(user1.username)
// now change use1.username 
user1.username = "Yongye"
print(user2.username)





