import Foundation

let CONNECTED: Int = 1
let UNCONNCTED: Int = 0

public struct Queue<T> {
    fileprivate var array = [T]()
    
    public var front: T? { return array.first }
    public var count: Int { return array.count }
    public var isEmpty: Bool { return array.isEmpty }
    public mutating func enqueue(_ element: T) { array.append(element) }
    public mutating func dequeue() -> T? { return isEmpty ? nil : array.removeFirst() }
}

func findShortDistance(size: Int, index: Int, visited: inout [Int], board: [[Int]]) {
    
    visited[index] = CONNECTED
    
    var queue = Queue<Int>()
    queue.enqueue(index)
    
    while !queue.isEmpty {
        
        guard let here = queue.front else { break }
        queue.dequeue()
        
        for index in board[here] where visited[index] < CONNECTED {
            queue.enqueue(index)
            visited[index] = visited[here] + 1
        }
     }
}


func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    
    var board = [[Int]](repeating: Array<Int>(), count: n)
    var visited = Array<Int>(repeating: UNCONNCTED, count: n)
    
    for node in edge {
        let index: (first: Int, second: Int) = (node.first! - 1, node.last! - 1)
        board[index.first].append(index.second)
        board[index.second].append(index.first)
    }
    
    findShortDistance(size: n, index: 0, visited: &visited, board: board)
    
    visited.sort()
    return visited.filter { visited.last! == $0 }.count
}