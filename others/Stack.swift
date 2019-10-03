// Stack (LIFO)
//
// http://en.wikipedia.org/wiki/Stack_(abstract_data_type)

struct Stack<Element: Equatable>: Equatable {
  private var storage: [Element] = []

  var isEmpty: Bool {
    return peek() == nil
  }

  init() { }

  init(_ elements: [Element]) {
    storage = elements
  }

  func peek() -> Element? {
    return storage.last
  }

  mutating func push(_ element: Element) {
    storage.append(element)
  }

  @discardableResult
  mutating func pop() -> Element? {
    return storage.popLast()
  }
}


var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(5)

print(stack)

// Should be 5
print(stack.pop())


// Should be 2
print(stack.peek())
