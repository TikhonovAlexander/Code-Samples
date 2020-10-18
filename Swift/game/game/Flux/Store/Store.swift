//
//  Store.swift
//  game
//
//  Created by atikhonov on 25.08.2020.
//

import Foundation
import Combine

class Store<State, Action>: ObservableObject {
    @Published private(set) var state: State
    
    private let reducer: Reducer<State, Action>
    private var cancellables: Set<AnyCancellable> = []
    
    init(state: State, reducer: @escaping Reducer<State, Action>) {
        self.state = state
        self.reducer = reducer
    }
    
    func send(action: Action) {
        guard let effect = reducer(&state, action) else { return }
        effect
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            }, receiveValue: send)
            .store(in: &cancellables)
    }
}
