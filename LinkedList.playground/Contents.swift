import Foundation

// build a node that has current value, and a pointer to a next node (no address)
class Node<Value> {
    var value: Value
    var next: Node?
    
    // because we may not have a node in the next field, normaml assignment is nil
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {

    var description: String {
    guard let next = next else {
      return "\(value)"
    }
    return "\(value) -> " + String(describing: next) + " "
  }
}

// struct building a linkedlist using node objects
struct LinkedList<Value> {
    // head node and tail node
    var head: Node<Value>?
    var tail: Node<Value>?
    
    // method for pushing a new value to the front of the list
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    //method for appending an item to end of the list, and updating tail
    mutating func append(_ value: Value) {
        
        // if list is empty, need to update both head/tail. Since list is empty, this is really a push command
        guard !isEmpty else {
            push(value)
            return
        }
        
        //if empty is false (contains nodes), then create new node after the tail node.
        tail!.next = Node(value: value)
        
        //update the tail to be the new tail
        tail = tail?.next
    }
    
    func node(at index: Int) -> Node<Value>? {
        //find particular node of interest (at index)
        var currentNode = head
        var currentIndex = 0
        
        //insert new node
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    
    mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        // few points: Classes are reference types, meaning they are not copied when passed into operations (value types are copied before passed)
        //!== means not identical; possible for multiple constants and variables to refer to the same single instance of a class behind the scenes
        // this is a case where the method is called on the tail node of the list
        // so check if the node is the tail node; if not then continue on otherwise it's tail node
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        // take the inserted node, and assign it's next value to the following nodes
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    // function or removing value at the front of the list
    mutating func pop() -> Value? {
        defer {
            // defer just means do this eventually, upon exiting the function
            // take the head node and re-assign to the next node
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        // return the value popped in case needed for storage
        return head?.value
    }
    
    // remove last function
    mutating func removeLast() -> Value? {
        // if head doesn't exist, return nil
        guard let head = head else {
            return nil
        }
        
        //instance where there is only 1 element in the list left
        guard head.next != nil else {
            return pop()
        }
        
        // keep searching for a next node until current.next is nil; signifies end of the list
        var prev = head
        var current = head
         
        while let next = current.next {
            prev = current
            current = next
        }
        
        // current is last node, disconnect it using prev.next & update the tail
        prev.next = nil
        tail = prev
        return current.value
    }
    
    mutating func remove(after node: Node<Value>) -> Value? {
      defer {
        if node.next === tail {
          tail = node
        }
        node.next = node.next?.next
      }
      return node.next?.value
    }
    
    var isEmpty: Bool {
        head == nil
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

var list = LinkedList<Int>()
list.push(3)
list.append(5)
list.push(7)
list.push(9)
list.push(2)
print("List before inserting items: \(list)")

var middleNode = list.node(at: 2)!
print("Middle node is : \(middleNode)")

for _ in 1...4 {
    middleNode = list.insert(-1, after: middleNode)
}

print("after insertion list is: \(list)")

list.pop()
print(list)

list.removeLast()
print(list)
let index = 4
let node = list.node(at: index)!
list.remove(after: node)
print(list)




