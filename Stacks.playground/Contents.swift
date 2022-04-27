public struct Stack<T> {
    //Stack constructed using generic T type to accept Int, String, or others
    private var storage: [T] = []
    //Initialization method to allow exteral array assignment to the storage
    public init(_ elements: [T]) {
        storage = elements
    }
    
    //Push to back of array O(1)
    public mutating func push(_ element: T) {
        storage.append(element)
    }
    //Pop last item appended O(1)
    public mutating func pop(_ element: T) {
        storage.popLast()
    }
    //Look at top element (last added) O(1)
    public func peek() -> T? {
        storage.last
    }
    
}
//Used to visualize the stack from custom implementeation above.
extension Stack: CustomDebugStringConvertible {

  public var debugDescription: String {
    """
    ----top----
    \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
    -----------
    """
  }
}

//create an array, assign to stack
var a = [0,1,3]
var s = Stack(a)
s.push(5)
print(s)
s.pop(5)
print(s)
print(s.peek()!)

//aStack based on typical array collection from Swift.
var aStack: [Int] = []
aStack.append(5)
print(aStack)
aStack.popLast()
print(aStack)






