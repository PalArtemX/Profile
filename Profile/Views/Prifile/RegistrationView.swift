//
//  RegistrationView.swift
//  Profile
//
//  Created by Artem Palyutin on 15.08.2021.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var textField1 = ""
    @State private var secureFieldOne = ""
    @State private var secureFieldTwo = ""
    
    var body: some View {
        VStack {
            // MARK: - Header
            Text("Registration")
                .font(.title2)
            
            // MARK: - User's photo
            Image(systemName: "person.fill.viewfinder")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 100)
                .padding()
            
            Button(action: {
                // cod
            }, label: {
                HStack {
                    Text("Add a Photo")
                    Image(systemName: "person.fill.viewfinder")
                }
            })
            
            // MARK: - Form Registration
            Form {
                
                Section(header: Text("Name", comment: "Section: Name")) {
                    TextField("enter name", text: $textField1)
                    TextField("enter last name", text: $textField1)
                }
                

                
                Section(header: Text("Email", comment: "Section: Email")) {
                    TextField("enter name", text: $textField1)
                        .keyboardType(.emailAddress)
                }
                
                
                Section(header: Text("Password", comment: "Section: Password")) {
                    SecureField("enter password", text: $secureFieldOne)
                    SecureField("enter password two", text: $secureFieldTwo)
                }
                
                Section {
                    Button(action: {
                        // cod
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Sign up")
                            Image(systemName: "person.badge.plus")
                            Spacer()
                        }
                    })
                }
                
            } // Form
        } // VStack
    }
}












struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RegistrationView()
            RegistrationView()
                .preferredColorScheme(.dark)
        }
    }
}
