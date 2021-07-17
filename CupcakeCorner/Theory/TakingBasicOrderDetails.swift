//
//  TakingBasicOrderDetails.swift
//  CupcakeCorner
//
//  Created by Sergio Sepulveda on 2021-07-17.
//

import SwiftUI

class Order: ObservableObject {
    static let types: [String] = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                self.extraFrosting = false
                self.addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
}

struct AddresView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Text("Hello World")
    }

}

struct TakingBasicOrderDetails: View {
    
    @ObservedObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(0..<Order.types.count) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper(value: $order.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.quantity)")
                    }
                }
                Section {
                    Toggle(isOn: $order.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }
                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Add extra frosting")
                        }
                        Toggle(isOn: $order.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: AddresView(order: order)) {
                        Text("Delivery Details")
                    }
                }
                
            }
            .navigationBarTitle("Cupcake corner")
        }
    }
}

struct TakingBasicOrderDetails_Previews: PreviewProvider {
    static var previews: some View {
        TakingBasicOrderDetails()
    }
}
