import Foundation

var parent = (0...101).compactMap { $0 }

func findRoot(_ child: Int) -> Int {
    if parent[child] != child {
        parent[child] = findRoot(parent[child])
    }
    return parent[child]
}

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var cost = 0
    costs.sorted { $0[2] < $1[2] }.forEach { connection in
        let root1 = findRoot(connection[0])
        let root2 = findRoot(connection[1])
        if root1 != root2 {
            parent[root1] = root2
            cost += connection[2]
        }
    }
    return cost
}