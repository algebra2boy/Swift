public class Node<Value> {

	public var value: Value
	// could be null
	public var next: Node?

	public init(value: Value, next:Node? = nil) {
		self.value = value
		self.next  = next
	}
}

// https://developer.apple.com/documentation/swift/customstringconvertible
extension Node: CustomStringConvertible {

	public var description: String {
		guard let next = next else {
			return "\(value)"
		}
		return "\(value) -> " + String(describing: next) + " "
	}

}

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)
node1.next = node2
node2.next = node3
print(node1)