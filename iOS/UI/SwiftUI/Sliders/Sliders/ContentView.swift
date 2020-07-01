//
//  ContentView.swift
//  Sliders
//
//  Created by atikhonov on 18.06.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let rTarget: Double = .random(in: 0..<1)
    let gTarget: Double = .random(in: 0..<1)
    let bTarget: Double = .random(in: 0..<1)
    
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    
    @State var showAlert = false
    
    var body: some View {
        
        VStack {
            HStack {
                VStack {
                    Color(red: rTarget, green: gTarget, blue: bTarget)
                    Text("Match this color")
                }
                VStack {
                    Color(red: rGuess, green: gGuess, blue: bGuess)
                     Text("R: \(Int(rGuess * 255.0))" + " G: \(Int(gGuess * 255.0))" + " B: \(Int(bGuess * 255.0))")
                }
            }
            Button(action: {
                self.showAlert = true
            }) {
                Text("Calculate")
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Your score"), message: Text(String(computeScore())))
            }
            .padding()
            RGBSlider(value: $rGuess, textColor: .red)
            RGBSlider(value: $gGuess, textColor: .green)
            RGBSlider(value: $bGuess, textColor: .blue)
        }
    }
    
    func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt((rDiff * rDiff + gDiff * gDiff + bDiff * bDiff) / 3.0)
        return lround((1.0 - diff) * 100.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}

struct RGBSlider: View {
    
    var value: Binding<Double>
    var textColor: Color
    
    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(textColor)
            Slider(value: value)
            Text("256")
                .foregroundColor(textColor)
        }
        .padding(.horizontal)
    }
}
