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

graph.add(.undirected, from: a, to: b, weight: 0)
graph.add(.undirected, from: a, to: c, weight: 0)
graph.add(.undirected, from: a, to: d, weight: 0)
graph.add(.undirected, from: b, to: e, weight: 0)
graph.add(.undirected, from: c, to: f, weight: 0)
graph.add(.undirected, from: c, to: g, weight: 0)
graph.add(.undirected, from: e, to: h, weight: 0)
graph.add(.undirected, from: e, to: f, weight: 0)
graph.add(.undirected, from: f, to: g, weight: 0)

extension Graph where Element: Hashable {
    func depthFirstSearch(source: Vertex<Element>) -> [Vertex<Element>] {
        
        var queue = QueueStack<Vertex<Element>>()
        var enqueued = Set<Vertex<Element>>()
        var visited: [Vertex<Element>] = []
        
        queue.enqueue(source)
        enqueued.insert(source)
        
        return visited
    }
}

//let vertices = graph.breadthFirstSearch(source: a)
//vertices.forEach { vertex in
//    print(vertex)
//}
