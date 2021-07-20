//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Sergio Sepulveda on 2021-07-17.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var orderObserver = OrderObserver()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $orderObserver.order.type) {
                        ForEach(0..<Order.types.count) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper(value: $orderObserver.order.quantity, in: 3...20) {
                        Text("Number of cakes: \(orderObserver.order.quantity)")
                    }
                }
                Section {
                    Toggle(isOn: $orderObserver.order.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }
                    if orderObserver.order.specialRequestEnabled {
                        Toggle(isOn: $orderObserver.order.extraFrosting) {
                            Text("Add extra frosting")
                        }
                        Toggle(isOn: $orderObserver.order.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(orderObserver: orderObserver)) {
                        Text("Delivery Details")
                    }
                }
                
            }
            .navigationBarTitle("Cupcake corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
