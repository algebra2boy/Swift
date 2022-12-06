let sayHello = {
	print("Hi, there!")
}

sayHello()


let sayHello2 = {
	(name : String) -> String in "Hi \(name)!"
}

print(sayHello2("Yongye"))