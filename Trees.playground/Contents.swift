// Generic collection type "Stack" will be defined below using generic types

// non generic version of a stack structure
struct IntStack {
    // items is an array of ints
    var items: [Int] = []
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

// Generic stack, "T" used as a placeholder. Type to be provided at time of struct creation
struct Stack<T> {
    var items: [T] = []
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

extension Stack: CustomDebugStringConvertible {
    var topItem: T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
    
    public var debugDescription: String {
        """
        ----top----
        \(items.map { "\($0)" }.reversed().joined(separator: "\n"))
        -----------
        """
      }
}
//
//var testIntStack = IntStack()
//var newStack = Stack<Int>()
//var stringStack = Stack<String>()
//
//testIntStack.push(5)
//testIntStack.push(9)
//testIntStack.push(6)
//testIntStack.pop()
//
//
//newStack.push(5)
//newStack.push(1)
//newStack.push(2)
//print(newStack.debugDescription)
//
//stringStack.push("hello")
//stringStack.push("why")
//print(stringStack.debugDescription)

// Test Problems
// 1.) Reverse a string using a Stack


func reverseString<T>(_ array: [T]) {
    var stack = Stack<T>()
    
    for item in array {
        stack.push(item)
    }
    
    while stack.items.isEmpty != true {
        print(stack.pop())
    }
}

var word = ["o","d","l","l","y"]
reverseString(word)




