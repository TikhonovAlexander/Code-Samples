//
//  CarViewDetail.swift
//  HelloWorld
//
//  Created by atikhonov on 21.06.2019.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import SwiftUI

struct CarViewDetail : View {
    let car: Car
    @State private var zoomed = false
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode:  zoomed ? .fill : .fit)
                .navigationBarTitle(Text(car.name), displayMode: .inline)
                .tapAction {
                    withAnimation(.basic(duration: 1)) {
                        self.zoomed.toggle()
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            if car.hasBTC && !zoomed  {
                Image(systemName: "bitcoinsign.circle")
                    .font(.title)
                    .padding(.all)
                .transition(.move(edge: .trailing))
            }
        }
    }
}

#if DEBUG
struct CarViewDetail_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                CarViewDetail(car: testData[0])
            }
            NavigationView {
                CarViewDetail(car: testData[1])
            }
        }
    }
}
#endif
