import UIKit

let operationQueue = OperationQueue()
operationQueue.maxConcurrentOperationCount = 2

protocol DataProvider { var data: Data? { get } }
class DownloadOperation: Operation, DataProvider {
    var id: Int
    private var downloadedData: Data?
    var data: Data? {
        downloadedData
    }
    init(id: Int) { self.id = id }
    override func main() {
        print("Start download \(id)")
        let str = """
        {
            "name": "Vasa"
        }
        """
        downloadedData = str.data(using: .utf8)
        sleep(3)
        print("Finish download \(id)")
    }
}

class DecryptOperation: Operation, DataProvider {
    var id: Int
    init(id: Int) { self.id = id }
    private var decryptedData: Data?
    var data: Data? {
        decryptedData
    }
    var downloadedData: Data? {
        dependencies
            .compactMap { $0 as? DataProvider }
            .first?.data
    }
    override func main() {
        print("Start decrypt \(id)")
        // decryption
        decryptedData = downloadedData
        sleep(2)
        print("Finish decrypt \(id)")
    }
}
struct Person: Codable { var name: String }
protocol PersonProvider { var person: Person? { get } }
typealias FinishBlock = (_ person: Person?) -> Void
class ParseOperation: Operation, PersonProvider {
    var id: Int
    init(id: Int) { self.id = id }
    var finishBlock: FinishBlock?
    var data: Data? {
        dependencies
            .compactMap { $0 as? DataProvider }
            .first?.data
    }
    private var parsedPerson: Person?
    var person: Person? {
        parsedPerson
    }
    override func main() {
        print("Start parse \(id)")
        sleep(2)
        if let data = data {
            parsedPerson = try? JSONDecoder().decode(Person.self, from: data)
        }
        print("Finish parse \(id)")
        DispatchQueue.main.async { [unowned self] in
            self.finishBlock?(self.parsedPerson)
        }
    }
}

let downloadOperation = DownloadOperation(id: 1)
let decryptOperation = DecryptOperation(id: 1)
let parseOperation = ParseOperation(id: 1)

decryptOperation.addDependency(downloadOperation)
parseOperation.addDependency(decryptOperation)

operationQueue.addOperation(decryptOperation)
operationQueue.addOperation(parseOperation)
operationQueue.addOperation(downloadOperation)

parseOperation.completionBlock = { [unowned parseOperation] in
    print("completionBlock \(Thread.current) \(parseOperation.person?.name)")
}

parseOperation.finishBlock = { person in
    print("finishBlock \(Thread.current) \(parseOperation.person?.name)")
}
