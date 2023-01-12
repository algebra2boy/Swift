
/*You can conform to as many protocols as you need, 
just by listing them one by one separated with a comma. 
If you ever need to subclass something and conform to a protocol,
 you should put the parent class name first, then write your protocols afterwards. */


protocol Vehicle {
    // It's not possible to create set-only properties in Swift.
    var name: String {get} // implictly saying this is a "let" variable because get only
    var currentPassengers: Int {get set} // readable and writtable 
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {

    let name: String = "Toyota"
    var currentPassengers = 1

    func estimateTime(for distance: Int) -> Int {
        return distance / 50
    }
    func travel(distance: Int) {
        print("I am driving \(distance) km ")
    }

    func openSunroof() {
        print("It's a nice day!")
    }


}

struct Bicycle: Vehicle {

    let name = "Voyage"
    var currentPassengers = 1

    func estimateTime(for distance: Int) -> Int {
        return distance / 10
    }
    func travel(distance: Int) {
        print("I am cycling \(distance) km ")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
        if vehicle.estimateTime(for: distance) > 100 {
            print("That's too slow")
        } else {
            vehicle.travel(distance: distance)
        }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
    
}


let car = Car()
commute(distance: 200, using: car)

let bike = Bicycle()
commute(distance: 20, using: bike)

getTravelEstimates(using: [car, bike], distance: 4000)


// it lets us hide information: rather than stating the exact type that is being returned
/*
So, when you see some View in your SwiftUI code, it’s effectively us telling Swift “this is going to send back some kind of view to lay out, but I don’t want to write out the exact thing 
– you figure it out for yourself.”
*/
func getRandomNumber() -> some Equatable {
    return Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    return Bool.random()
}

print(getRandomNumber() == getRandomNumber())


struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int

}

extension Book {
    // add it here to perverse auto member wise initializer 
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)
let book2 = Book(title: "Hello", pageCount: 1000)
