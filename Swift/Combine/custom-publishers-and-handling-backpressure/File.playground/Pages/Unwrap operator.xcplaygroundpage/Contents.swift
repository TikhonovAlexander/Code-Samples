import Combine

extension Publisher {
    func unwrap<T>() -> Publishers.CompactMap<Self, T> where Output == Optional<T> {
        compactMap { $0 }
    }
}

let values: [Int?] = [1, 2, nil, 3, nil, 4]
values.publisher
    .unwrap()
    .sink {
    print("Received value: \($0)")
}

