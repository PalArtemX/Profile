//
//  LoginView.swift
//  Profile
//
//  Created by Artem Palyutin on 15.08.2021.
//

import SwiftUI

struct LoginView: View {
    
    @State private var user = ""
    
    var body: some View {
        NavigationView {
                Form {
                    Section(header: Text("email")) {
                        TextField("enter email", text: $user)
                            .keyboardType(.emailAddress)
                    }
                    Section(header: Text("password")) {
                        SecureField("enter pasword", text: $user)
                    }
                    
                    Section {
                        Button(action: {
                            // cod
                        }, label: {
                            HStack {
                                Spacer()
                                Text("Login")
                                Image(systemName: "person")
                                Spacer()
                            }
                            .font(.headline)
                    })
                        
                    }
                }
            
            .navigationTitle("Login")
        }
    }
}











struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
            LoginView()
                .preferredColorScheme(.dark)
        }
    }
}
