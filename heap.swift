//
//  heap.swift
//  
//
//  Created by Jacob Case on 5/31/22.
//

import Foundation

struct heap {
    var elements: [Int]
    var priorityFunction: (Int, Int) -> Bool
       
    //Build a heap, min or max depending on priority funciont (i.e < or >)
    init(elements: [Int] = [], priorityFunction: @escaping (Int, Int) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    
    mutating func buildHeap() {
        for index in (0..<sizeOfHeap / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }
    
    
    //heap property helpers
    var isEmpty : Bool {
        return elements.isEmpty
    }
    
    var sizeOfHeap : Int {
        return elements.count
    }
    
    func peek() -> Int? {
        return elements.first
    }
    
    //index helper methods
    func isRoot(_ index: Int) -> Bool {
        return (index==0)
    }
    
    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    //
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
      return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    //Takes in a child and parent index of two values, returns whichever is greater value
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        //if the child index is valid (i.e not a root) and is greater value than parent, return the child, otherwise return parent
        guard childIndex < sizeOfHeap && isHigherPriority(at: childIndex, than: parentIndex) else { return parentIndex}
        return childIndex
    }
    
    //check the parent node against both left and right child values
    //return whichever of the 3 has the higher value
    func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        //make sure the two elements aren't in the same index
        guard firstIndex != secondIndex else {return}
        //if not, swap is OK
        elements.swapAt(firstIndex, secondIndex)
    }
    
    mutating func addElement(_ element: Int) {
        elements.append(element)
        siftUp(elementAtIndex: sizeOfHeap - 1)
    }
    
    mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index), isHigherPriority(at: index, than: parent) else {return}
        swapElement(at: parent, with: index)
        siftUp(elementAtIndex: parent)
    }
    
    mutating func removeTop() -> Int? {
        guard !isEmpty else {return nil}
        swapElement(at: 0, with: sizeOfHeap-1)
        let element = elements.removeLast()
        if !isEmpty {
            //top removed, but may not be conforming ot heap properties
            //sift down until valid
            siftDown(elementAtIndex: 0)
        }
        return element
    }
    
    mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        if index == childIndex {
            return
        }
        swapElement(at: index, with: childIndex)
        siftDown(elementAtIndex: childIndex)
    }
    
    
}

