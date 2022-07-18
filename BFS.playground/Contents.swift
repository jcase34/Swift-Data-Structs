/*
 Jacob Case - July 18 2021
 Iterative BFS skeleton code in swift
 Assumption:
    Given a graph or tree and a starting root node
    Graph/tree class defined outside of this function
    
    Allowed to use an array as the queue for BFS
        Proper implementation would be to use a queue from API or custom data struct
 
 
 */

func iterative_BFS(_ graph: Graph, _ root: Node) {
    
    // Check that the root is actually there, if not bail.
    // Can also be done with guard statement.
    if root == nil {
        return
    }
    
    var queue: [Node] = [] // create queue from array
    queue.append(root) // add root/first node into queue
    
    //while we have nodes in queue
    while !queue.isEmpty {
        // pull out first element
        let node = queue.removeFirst() //can also use removeAt: 0
        
        if let leftNode = node.left {
            queue.append(leftNode)
        }
        
        if let rightNode = node.right {
            queue.append(rightNode)
        }
        
        
    }
    
}
