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

graph.add(.directed, from: a, to: b, weight: 0)
graph.add(.directed, from: b, to: c, weight: 0)
graph.add(.directed, from: c, to: d, weight: 0)
graph.add(.directed, from: d, to: h, weight: 0)
graph.add(.directed, from: c, to: f, weight: 0)
graph.add(.directed, from: g, to: f, weight: 0)
graph.add(.directed, from: a, to: g, weight: 0)
graph.add(.directed, from: a, to: d, weight: 0)
graph.add(.directed, from: h, to: a, weight: 0)

//graph.add(.directed, from: a, to: b, weight: 0)
//graph.add(.directed, from: b, to: c, weight: 0)
//graph.add(.directed, from: c, to: d, weight: 0)
//graph.add(.directed, from: d, to: h, weight: 0)
//graph.add(.directed, from: a, to: h, weight: 0)
//graph.add(.directed, from: c, to: f, weight: 0)

extension Graph where Element: Hashable {
    func detectCycle(source: Vertex<Element>) -> Bool {
        var stacked = Set<Vertex<Element>>()
        let a = hasCycle(source: source, stacked: &stacked)
        print(stacked)
        return a
    }
    
    private func hasCycle(source: Vertex<Element>, stacked: inout Set<Vertex<Element>>) -> Bool {
        stacked.insert(source)
        let vertexEdges = edges(from: source)
        for edge in vertexEdges {
            if !stacked.contains(edge.destination) && hasCycle(source: edge.destination, stacked: &stacked) {
                return true
            } else if stacked.contains(edge.destination) {
                return true
            }
        }
        stacked.remove(source)
        return false
    }
}

let detectCycle = graph.detectCycle(source: a)
