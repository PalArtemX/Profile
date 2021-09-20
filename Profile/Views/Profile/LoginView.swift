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
                    // MARK: - User Sing In
                    Section(header: Text("email")) {
                        TextField("enter email", text: $vm.profile.email)
                            .keyboardType(.emailAddress)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                    
                    Section(header: Text("password")) {
                        SecureField("enter pasword", text: $vm.profile.password)
                    }
                    
                    // MARK: - Button "Login"
                    Section {
                        ButtonLogin(vm: vm)
                    }
                } // Form
                
                // MARK: - Button "Sign Up"
                SignUpView(isPresented: $isPresented)
                
                
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
        }
    }
}




struct ButtonLogin: View {
    
    @ObservedObject var vm: ProfileVM
    @State private var showAlert = false
    
    var body: some View {
        Button(action: {
            guard !vm.profile.email.isEmpty, vm.profile.password.count >= 6 else {
                showAlert.toggle()
                return }
            
            vm.signIn(email: vm.profile.email, password: vm.profile.password)
            
            vm.profile.email = ""
            vm.profile.password = ""
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if vm.isSignedIn == false {
                    showAlert.toggle()
                }
            }
        }, label: {
            HStack {
                Spacer()
                Text("Login")
                Image(systemName: "person")
                Spacer()
            }
            .font(.headline)
        })
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Attention"), message: Text("Email or password is incorrect"), dismissButton: .cancel())
        })
    }
}

struct SignUpView: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        HStack {
            Text("Don't have an account?", comment: "Button Sing Up")
                .foregroundColor(Color(.systemGray3))
            Button(action: {
                isPresented.toggle()
            }, label: {
                HStack {
                    Text("Sign Up")
                    Image(systemName: "person.badge.plus")
                }
                .padding()
            })
        }

    }
}
