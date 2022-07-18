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
class Solution {
    func removeLeafNodes(_ root: TreeNode?, _ target: Int) -> TreeNode? {
        
        guard let root = root else {return nil}
        var dummyNode: TreeNode? = nil
        
        var stack:[(TreeNode?,Bool, TreeNode?)] = [(root,false, dummyNode)]
        //tuple to track nodes and visited or not
        
        while !stack.isEmpty {
            var nodeSet = stack.popLast()
            
            //check if visited
            if nodeSet!.1 == true {
            
                if nodeSet!.0!.val == target && nodeSet!.0!.left == nil && nodeSet!.0!.right == nil {
                    if nodeSet!.2 == nil {
                        return nil
                    } else if nodeSet!.0 === nodeSet!.2!.left {
                        nodeSet!.2!.left = nil
                    } else if nodeSet!.0 === nodeSet!.2!.right {
                        nodeSet!.2!.right = nil
                    }
                }
                
                
            } else {
                stack.append((nodeSet!.0, true, nodeSet!.2))
                
                
                if let left = nodeSet!.0!.left {
                    stack.append((left, false, nodeSet!.0))
                }
                
                if let right = nodeSet!.0!.right {
                    stack.append((right, false, nodeSet!.0))
                }
            }
        }
        return root
    }
}
