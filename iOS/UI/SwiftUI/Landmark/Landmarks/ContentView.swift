//
//  ContentView.swift
//  Landmarks
//
//  Created by atikhonov on 20.08.2019.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack() {
            
            
            
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            Text("Turtle Rock")
                .font(.title)
                .foregroundColor(.red)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
