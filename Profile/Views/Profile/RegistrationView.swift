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
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                // MARK: - Form Registration
                Form {
                    Section(header: Text("Email", comment: "Section: Email")) {
                        TextField("Enter email...", text: $vm.profile.email)
                            .keyboardType(.emailAddress)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                    
                    Section(header: Text("Password", comment: "Section: Password")) {
                        SecureField("Enter password...", text: $vm.profile.password)
                        SecureField("Enter password again...", text: $vm.profile.passwordCheck)
                    }
                    .disableAutocorrection(true)
                    .autocapitalization(.none) 
                } // Form
                // MARK: - Button "Sign Up"
                ButtonSignUpView(vm: vm, presentationMode: _presentationMode, showAlert: $showAlert)
                    .padding()
            }
            .navigationTitle("Registration")
        } // NavigationView
    }
}











struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RegistrationView(vm: ProfileVM())
        }
    }
}



struct ButtonSignUpView: View {
    
    @ObservedObject var vm: ProfileVM
    @Environment(\.presentationMode) var presentationMode
    @State private var message = ""
    @Binding var showAlert: Bool
    
    var body: some View {
        Button(action: {
            guard !vm.profile.email.isEmpty else {
                message = "Email is not entered or entered incorrectly!"
                showAlert.toggle()
                return }
            guard vm.profile.password.count >= 5 else {
                message = "Password must have at least 6 characters!"
                showAlert.toggle()
                return }
            guard vm.profile.password == vm.profile.passwordCheck else {
                message = "Passwords don't match!"
                showAlert.toggle()
                return }
            vm.signUp(email: vm.profile.email, password: vm.profile.password)
            
            // FIXME: - presentationMode dismis
            presentationMode.wrappedValue.dismiss()
            
            
        }, label: {
            HStack {
                Spacer()
                Text("Sign Up")
                Image(systemName: "person.badge.plus")
                Spacer()
            }
        })
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Attention"), message: Text(message), dismissButton: .cancel())
        })
    }
}













