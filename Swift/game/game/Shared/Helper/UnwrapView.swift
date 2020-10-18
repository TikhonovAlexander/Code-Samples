//
//  UnwrapView.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 15.10.20.
//

import SwiftUI

/// Wrapper for optional SwiftUI views
struct UnwrapView<Value, Content: View>: View {
    private let value: Value?
    private let contentProvider: (Value) -> Content

    var body: some View {
        value.map(contentProvider)
    }

    init(_ value: Value?, @ViewBuilder content: @escaping (Value) -> Content) {
        self.value = value
        self.contentProvider = content
    }
}
