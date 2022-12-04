func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)




// throw an error 

enum PasswordError: Error {
    case short, obvious
}


func checkPassword (_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    } 

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }

}

var s = "12345"
do {
    let result = try checkPassword(s)
    print("Passoword result \(result)")
} catch PasswordError.short {
    print("Password too short")
} catch PasswordError.obvious {
    print("password obvious")
}

s = "12"
do {
    let result = try checkPassword(s)
    print("Passoword result \(result)")
} catch PasswordError.short {
    print("Password too short")
} catch PasswordError.obvious {
    print("password obvious")
}


