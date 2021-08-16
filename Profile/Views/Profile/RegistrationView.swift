//
//  RegistrationView.swift
//  Profile
//
//  Created by Artem Palyutin on 15.08.2021.
//

import SwiftUI

struct RegistrationView: View {
    
    @ObservedObject var vm: ProfileVM
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
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
                        //TextField("", text: $vm.profile.nameTextField)
                        //TextField("", text: $vm.profile.lastNameTextField)
                    }
                         
                    Section(header: Text("Email", comment: "Section: Email")) {
                        TextField("enter email", text: $vm.profile.emailSignUp)
                            .keyboardType(.emailAddress)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                    
                    Section(header: Text("Password", comment: "Section: Password")) {
                        SecureField("enter password", text: $vm.profile.passSignUp)
                        //SecureField("", text: $vm.profile.passwordAgainSecureField)
                    }
                    
                    Section {
                        Button(action: {
                            guard !vm.profile.emailSignUp.isEmpty, !vm.profile.passSignUp.isEmpty else { return }
                            
                            vm.signUp(email: vm.profile.emailSignUp, password: vm.profile.emailSignUp)
                            
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            HStack {
                                Spacer()
                                Text("Sign Up")
                                Image(systemName: "person.badge.plus")
                                Spacer()
                            }
                            .font(.headline)
                        })
                    }
                    
                } // Form
            }
            .navigationTitle("Registration")
        } // NavigationView
    }
}












struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RegistrationView(vm: ProfileVM())
            RegistrationView(vm: ProfileVM())
                .preferredColorScheme(.dark)
        }
    }
}
