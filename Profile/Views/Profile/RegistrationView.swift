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
                UserPhotoView()
                
                // MARK: - Form Registration
                Form {
                    Section(header: Text("Email", comment: "Section: Email")) {
                        TextField("Enter email...", text: $vm.profile.email)
                            .keyboardType(.emailAddress)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                    
                    Section(header: Text("Password", comment: "Section: Password")) {
                        SecureField("enter password...", text: $vm.profile.password)
                        SecureField("enter password again...", text: $vm.profile.passwordCheck)
                    }
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    
                    // MARK: - Button "Sign Up"
                    Section {
                        Button(action: {
                            guard !vm.profile.email.isEmpty else { return }
                            guard vm.profile.password.count >= 5 else { return }
                            guard vm.profile.password == vm.profile.passwordCheck else { return }
                            withAnimation(.easeInOut) {
                                vm.signUp(email: vm.profile.email, password: vm.profile.password)
                            }
                            
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
