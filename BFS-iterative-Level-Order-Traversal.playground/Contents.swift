/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
*
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    
    // Check if root is valid
    guard let root = root else {return []}
    
    var queue = [TreeNode]() //create a array based queue
    var result = [[Int]]() //create results array
    
    queue.append(root) //add root to queue if valid
    
    while !queue.isEmpty {
        
        // Create a placeholder for node per level using array
        var nodeByLevel = [Int]()

        // For each node in queue
        for _ in 0..<queue.count {
            
            // Grab the first node in queue
            let currentNode = queue.removeFirst()
            
            // Store that node at the given level
            nodeByLevel.append(currentNode.val)
            
            // Want to store left to right, so start with left node
            if let left = currentNode.left {
                //add left child node if valid
                queue.append(left)
            }
            
            if let right = currentNode.right {
                //add right child node if valid
                queue.append(right)
            }
        }
        // Add the node per level array to result at index
        result.append(nodeByLevel)
    }

    return result
}

