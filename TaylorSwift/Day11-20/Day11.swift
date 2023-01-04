struct BankAccount {
	
	private var balance : Double = 0

	mutating func deposit (amount: Double) {
		balance += amount
	}

	mutating func withdraw(amount: Double) -> Bool {
        if balance >= amount {
            balance -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

/*
Use private for “don’t let anything outside the struct use this.”
Use fileprivate for “don’t let anything outside the current file use this.”
Use public for “let anyone, anywhere use this.”
*/

struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}
School.add(student: "Taylor Swift")
print(School.studentCount)


var s = School()
// This does not work because studentCount is declared as a static variable, which means it belongs to the struct 
/*
print(s.studentCount)
*/

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}


struct Employee {
    let username: String
    let password: String

    // we have use the static keyword to create its type 
    static let example = Employee(username: "cfederighi", password: "hairforceone")
}

// this is clean way. no need to make an instance
print(AppData.version)
print(AppData.saveFilename)
print(AppData.homeURL)



