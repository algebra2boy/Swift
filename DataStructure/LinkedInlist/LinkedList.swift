public struct LinkedList<Value> {

	// could be none
	public var head: Node<Value>?
	public var tail: Node<Value>?

	public init() {}

	// computed property
	public var isEmpty: Bool {
		return head == nil
	}

	public mutating func push(_ value: Value) {
		head = Node(value: value, next: head)
		if (tail == nil) {
			tail = head
		}
	}

}

extension LinkedList: CustomStringConvertible {

	public var description: String {
		guard let head = head else {
			return "Empty list"
		}
		return String(describing: head)
	}

}