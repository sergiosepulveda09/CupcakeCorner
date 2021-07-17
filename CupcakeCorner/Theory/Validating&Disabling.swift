//
//  Validating&Disabling.swift
//  CupcakeCorner
//
//  Created by Sergio Sepulveda on 2021-07-17.
//

import SwiftUI

struct Validating_Disabling: View {
    
    @State var username: String = ""
    @State var email: String = ""
    
    var disableForm: Bool {
        username.isEmpty || email.isEmpty
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            .disabled(disableForm)
        }
    }
}

struct Validating_Disabling_Previews: PreviewProvider {
    static var previews: some View {
        Validating_Disabling()
    }
}
