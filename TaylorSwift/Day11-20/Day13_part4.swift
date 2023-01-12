extension Array {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
/*
// this is for Array, set, and dictionary
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
*/

let guests = ["Mario", "Luigi", "Peach"]

if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    //func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

// although Person is a protocol, which means it needs name and sayhello
// but we have sayHello() in extension, so we don't need to require them anymore
struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()