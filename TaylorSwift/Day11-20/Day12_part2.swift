/*
1. You don't use func with deinitializers
2. Deinitializers can never take parameters or return data
3. Deinitializers run when the last copy of a class instance is destroyed
4. We never call deinitializers directly
4. Structs don't have deinitializers
*/

class User {
	let id: Int

	init(id: Int) {
		self.id = id
		print("User \(id): I'm alive")
	}
	// save memory due to the deallocation
	// when we manually want to deallocate instances
	deinit {
		print("User \(id): I am dead!")
	}

}

var users: Array<User> = [User]()

for i in 1...5 {
	let user = User(id: i)
	users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

