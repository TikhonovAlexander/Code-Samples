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

let graph2 = AdjacencyMatrix<String>()
let a2 = graph2.createVertex(data: "A")
let b2 = graph2.createVertex(data: "B")
let c2 = graph2.createVertex(data: "C")
let d2 = graph2.createVertex(data: "D")
let e2 = graph2.createVertex(data: "E")
let f2 = graph2.createVertex(data: "F")
let g2 = graph2.createVertex(data: "G")
let h2 = graph2.createVertex(data: "H")

graph2.add(.undirected, from: a2, to: b2, weight: 0)
graph2.add(.undirected, from: a2, to: c2, weight: 0)
graph2.add(.undirected, from: a2, to: d2, weight: 0)
graph2.add(.undirected, from: e2, to: h2, weight: 0)
graph2.add(.undirected, from: e2, to: f2, weight: 0)
graph2.add(.undirected, from: f2, to: g2, weight: 0)

extension Graph where Element: Hashable {
    func breadthFirstSearch(source: Vertex<Element>) -> [Vertex<Element>] {
        
        var queue = QueueStack<Vertex<Element>>()
        var enqueued = Set<Vertex<Element>>()
        var visited: [Vertex<Element>] = []
        
        queue.enqueue(source)
        enqueued.insert(source)
        
        while let vertex = queue.dequeue() {
            visited.append(vertex)
            let vertexEdges = edges(from: vertex)
            vertexEdges.forEach { edge in
                if !enqueued.contains(edge.destination) {
                    queue.enqueue(edge.destination)
                    enqueued.insert(edge.destination)
                }
            }
        }
        return visited
    }
}

extension Graph where Element: Hashable {
    func isDisconnected(source: Vertex<Element>) -> Bool {
        let visited = breadthFirstSearch(source: source)
        for vertex in allVertices {
            if !visited.contains(vertex) {
                return true
            }
        }
        return false
    }
}

graph.isDisconnected(source: a)
graph.isDisconnected(source: g)
graph2.isDisconnected(source: a)
graph2.isDisconnected(source: g)

