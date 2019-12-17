import Foundation

let graph = AdjacencyMatrix<String>()
let a = graph.createVertex(data: "A")
let b = graph.createVertex(data: "B")
let c = graph.createVertex(data: "C")
let d = graph.createVertex(data: "D")
let e = graph.createVertex(data: "E")
let f = graph.createVertex(data: "F")
let g = graph.createVertex(data: "G")
let h = graph.createVertex(data: "H")
let i = graph.createVertex(data: "I")
let j = graph.createVertex(data: "J")

graph.add(.undirected, from: a, to: b, weight: 0)
graph.add(.undirected, from: a, to: c, weight: 0)
graph.add(.undirected, from: a, to: d, weight: 0)
graph.add(.undirected, from: c, to: i, weight: 0)
graph.add(.undirected, from: i, to: j, weight: 0)
graph.add(.undirected, from: i, to: f, weight: 0)
graph.add(.undirected, from: i, to: g, weight: 0)
graph.add(.undirected, from: g, to: f, weight: 0)
graph.add(.undirected, from: f, to: e, weight: 0)
graph.add(.undirected, from: h, to: e, weight: 0)

extension Graph where Element: Hashable {
    func breadthFirstSearch(source: Vertex<Element>) -> [Vertex<Element>] {
        
        var queue = QueueStack<Vertex<Element>>()
        var enqueued = Set<Vertex<Element>>()
        var visited: [Vertex<Element>] = []
        
        queue.enqueue(source)
        enqueued.insert(source)
        
        breadthFirstSearch(queue: &queue, enqueued: &enqueued, visited: &visited)
        
        return visited
    }
    
    private func breadthFirstSearch(queue: inout QueueStack<Vertex<Element>>, enqueued: inout Set<Vertex<Element>>, visited: inout [Vertex<Element>]) {
        guard let source = queue.dequeue() else { return }
        visited.append(source)
        let vertexEdges = edges(from: source)
        vertexEdges.forEach { edge in
            if !enqueued.contains(edge.destination) {
                queue.enqueue(edge.destination)
                enqueued.insert(edge.destination)
            }
        }
        breadthFirstSearch(queue: &queue, enqueued: &enqueued, visited: &visited)
    }
}

let vertices = graph.breadthFirstSearch(source: a)
vertices.forEach { vertex in
    print(vertex)
}
