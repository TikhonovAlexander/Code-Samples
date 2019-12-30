import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()
example(of: "Joke API") {
    class DadJokes {
        struct Joke: Codable {
            let id: String
            let joke: String
        }
        func getJoke(id: String) -> AnyPublisher<Joke, Error> {
            let url = URL(string: "https://icanhazdadjoke.com/j/\(id)")!
            var request = URLRequest(url: url)
            request.allHTTPHeaderFields = ["Accept": "application/json"]
            return URLSession.shared
                .dataTaskPublisher(for: request)
                .tryMap { data, _ -> Data in
                    guard let obj = try? JSONSerialization.jsonObject(with: data), let dict = obj as? [String: Any], dict["status"] as? Int == 404 else { return data }
                    throw DadJokes.Error.jokeDoesntExist(id: id)
            }
            .decode(type: Joke.self, decoder: JSONDecoder())
            .mapError { error -> DadJokes.Error in
                switch error {
                case is URLError:
                    return .network
                case is DecodingError:
                    return .parsing
                default:
                    return error as? DadJokes.Error ?? .unknown
                }
            }
            .eraseToAnyPublisher()
        }
        
        enum Error: Swift.Error, CustomStringConvertible {
            case network
            case jokeDoesntExist(id: String)
            case parsing
            case unknown
            var description: String { switch self {
            case .network:
                return "Request to API Server failed"
            case .parsing:
                return "Failed parsing response from server"
            case .jokeDoesntExist(let id):
                return "Joke with ID \(id) doesn't exist"
            case .unknown:
                return "An unknown error occurred"
                }
            }
        }
    }
    
    let api = DadJokes()
    let jokeID = "vPmy5EtPKuc"
    let badJokeID = "123456"
    api
        .getJoke(id: jokeID)
        .sink(receiveCompletion: { print($0) }, receiveValue: { print("Got joke: \($0)") })
        .store(in: &subscriptions)
}
