//
//  ContentView.swift
//  HelloWorld
//
//  Created by atikhonov on 20.06.2019.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @ObjectBinding var store = CarStore()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addCar) {
                        Text("Add car")
                    }
                }
                Section {
                    ForEach(store.cars) { car in
                        CarCell(car: car)
                    }
                    .onDelete(perform: delete)
                }
                }
                .navigationBarTitle(Text("Cars"))
                .navigationBarItems(trailing: EditButton())
                .listStyle(.grouped)
        }
    }
    
    func addCar() {
        store.cars.insert(Car(name: "Car new", price: 666, imageName: "4", hasBTC: true), at: 0)
    }
    
    func delete(at offsets: IndexSet) {
        for a in offsets {
            store.cars.remove(at: a)
        }
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: CarStore(cars: testData))
            
            ContentView(store: CarStore(cars: testData))
            .environment(\.sizeCategory, .extraExtraExtraLarge)
            
            ContentView(store: CarStore(cars: testData))
            .environment(\.colorScheme, .dark)
        }
    }
}
#endif

struct CarCell : View {
    
    let car: Car
    
    var body: some View {
        return NavigationButton(destination: CarViewDetail(car: car)) {
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(car.name)
                    .font(.title)
                Text("\(car.price)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
