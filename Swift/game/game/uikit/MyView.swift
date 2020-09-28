//
//  MyView.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 28.09.20.
//

import UIKit
import SwiftUI

struct MyView: UIViewRepresentable {

    func makeUIView(context: Context) -> MyUIKitView {
        let v = MyUIKitView(frame: .zero)
        return v
    }

    func updateUIView(_ uiView: MyUIKitView, context: Context) { }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
