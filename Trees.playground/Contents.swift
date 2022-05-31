
//Outline of the Node struct, able to use this as a root or child. A leaf does not have any children.
public class Node<T> {
    public var value: T
    public var children: [Node] = []

    //Init method for generating a node with any generic type
    public init(_ value: T) {
        self.value = value
    }

    //Add a child node. Leaf has no children.
    public func add(_ child: Node) {
        children.append(child)
    }
}

//First extension of Node that allows searching in depth any of it's children nodes. Continue this process recursively until no more children nodes left.
extension Node {
    public func forEachDepthFirst(visit: (Node) -> Void) {
        visit(self)
        children.forEach { child in
            child.forEachDepthFirst(visit: visit)
        }
    }
}

extension Node {
    public func levelOrderTraversal(visit: (Node) -> Void) {
        visit(self)
        print(visit(self))
        var queue: [Node] = []
        children.forEach { queue.insert($0, at: 0) }
        while let node = queue.popLast() {
            visit(node)
            node.children.forEach { queue.insert($0, at: 0)}
        }
    }
}

//Make a simple tree of beverages.
func makeBeverageTree() -> Node<String> {
  let tree = Node("Beverages")

  let hot = Node("hot")
  let cold = Node("cold")

  let tea = Node("tea")
  let coffee = Node("coffee")
  let chocolate = Node("cocoa")

  let blackTea = Node("black")
  let greenTea = Node("green")
  let chaiTea = Node("chai")

  let soda = Node("soda")
  let milk = Node("milk")

  let gingerAle = Node("ginger ale")
  let bitterLemon = Node("bitter lemon")

  tree.add(hot)
  tree.add(cold)

  hot.add(tea)
  hot.add(coffee)
  hot.add(chocolate)

  cold.add(soda)
  cold.add(milk)

  tea.add(blackTea)
  tea.add(greenTea)
  tea.add(chaiTea)

  soda.add(gingerAle)
  soda.add(bitterLemon)

  return tree
}

//Tree contains beverage tree.
let tree = makeBeverageTree()
//Print all nodes within the tree using depth traversal.
//tree.forEachDepthFirst { print($0.value)}
tree.levelOrderTraversal { print($0.value)}
