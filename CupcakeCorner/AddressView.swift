//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Sergio Sepulveda on 2021-07-17.
//

import SwiftUI


struct AddressView: View {
    @ObservedObject var orderObserver: OrderObserver
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $orderObserver.order.name)
                TextField("Street Address", text: $orderObserver.order.streetAddress)
                TextField("City", text: $orderObserver.order.city)
                TextField("Zip", text: $orderObserver.order.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(orderObserver: orderObserver)) {
                    Text("Check out")
                }
            }
            .disabled(orderObserver.order.hasValidAddress == false)
        }
        .navigationBarTitle("Delivery Details", displayMode: .inline)
    }
}
struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(orderObserver: OrderObserver())
    }
}
