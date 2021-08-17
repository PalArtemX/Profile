//
//  LoginView.swift
//  Profile
//
//  Created by Artem Palyutin on 15.08.2021.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var vm: ProfileVM
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("email")) {
                        TextField("enter email", text: $vm.profile.email)
                            .keyboardType(.emailAddress)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                    
                    Section(header: Text("password")) {
                        SecureField("enter pasword", text: $vm.profile.password)
                    }
                    
                    Section {
                        Button(action: {
                            guard !vm.profile.email.isEmpty, !vm.profile.password.isEmpty else { return }
                            
                            vm.signIn(email: vm.profile.email, password: vm.profile.password)
                            
                            vm.profile.email = ""
                            vm.profile.password = ""
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
                } // Form
                
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.gray)
                    Button(action: {
                        isPresented.toggle()
                    }, label: {
                        Text("Sign Up")
                })
                }
                .padding(.bottom, 50)
                
            } // VStack
            .sheet(isPresented: $isPresented, content: { RegistrationView(vm: vm) })
            .navigationTitle("Login")
        } // NavigationView
    }
}











struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView(vm: ProfileVM())
            LoginView(vm: ProfileVM())
                .preferredColorScheme(.dark)
        }
    }
}
