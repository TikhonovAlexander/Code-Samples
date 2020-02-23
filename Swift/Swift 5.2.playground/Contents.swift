import UIKit
import Combine

// You can call values of types that declare func callAsFunction methods like functions.

struct PostmanEchoTimeStampCheckResponse: Decodable, Hashable {
    let valid: Bool
}

class Request {
    
    var url: URL
    var cancellable: AnyCancellable? = nil
    
    init(url: URL) {
        self.url = url
    }
    
    func callAsFunction() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: PostmanEchoTimeStampCheckResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { completion in
                print(completion)
            }) { postmanResponse in
                print("Valid: \(postmanResponse.valid)")
        }
    }
    
    func callAsFunction(completion: @escaping () -> Void) {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: PostmanEchoTimeStampCheckResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { comp in
                print(comp)
                completion()
            }) { postmanResponse in
                print("Valid: \(postmanResponse.valid)")
        }
    }
    
    
}

let url = URL(string: "https://postman-echo.com/time/valid?timestamp=2016-10-10")!
var request = Request(url: url)
request.callAsFunction {
    print("completion")
}

// Subscripts can now declare default arguments.

struct Matrix {
    
    private var array = [[Int]]()
    
    init() {
        array = []
        array.append([1, 2, 3])
        array.append([4, 5, 6])
        array.append([7, 8, 9])
    }
    
    subscript(x: Int = 0, y: Int = 0) -> Int {
        array[x][y]
    }
}

let matrix = Matrix()
matrix[2]
matrix[]
matrix[1, 2]
