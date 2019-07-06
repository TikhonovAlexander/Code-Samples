




//: [Previous](@previous)

import Combine
import Foundation

struct IPInfo: Codable {
    // matching the data structure returned from ip.jsontest.com
    var ip: String
}

let myURL = URL(string: "http://ip.jsontest.com")

enum testFailureCondition: Error {
    case invalidServerResponse
}


let remoteDataPublisher = URLSession.shared.dataTaskPublisher(for: myURL!)
    .tryMap { data, response -> Data in
        guard let httpResponse = response as? HTTPURLResponse,
            // this will casue an .failure completion on anything other than a 200 response
            httpResponse.statusCode == 200 else {
                throw testFailureCondition.invalidServerResponse
        }
        return data
}
.decode(type: IPInfo.self, decoder: JSONDecoder())
    .eraseToAnyPublisher()
    .sink { (info) in
        print(info)
}






//: [Next](@next)
