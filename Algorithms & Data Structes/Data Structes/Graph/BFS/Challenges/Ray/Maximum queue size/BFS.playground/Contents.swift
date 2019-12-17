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
    func maximumQueueSize(source: Vertex<Element>) -> Int {
        
        var queue = QueueStack<Vertex<Element>>()
        var enqueued = Set<Vertex<Element>>()
        var visited: [Vertex<Element>] = []
        
        queue.enqueue(source)
        enqueued.insert(source)
        
        var maxSize = 1
        var counter = 1
        
        while let vertex = queue.dequeue() {
            counter -= 1
            visited.append(vertex)
            let vertexEdges = edges(from: vertex)
            vertexEdges.forEach { edge in
                if !enqueued.contains(edge.destination) {
                    queue.enqueue(edge.destination)
                    counter += 1
                    enqueued.insert(edge.destination)
                }
            }
            maxSize = max(maxSize, counter)
        }
        return maxSize
    }
}

let maxSize = graph.maximumQueueSize(source: a)



