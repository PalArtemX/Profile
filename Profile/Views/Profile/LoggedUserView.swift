//
//  LoggedUserView.swift
//  Profile
//
//  Created by Artem Palyutin on 17.08.2021.
//

import SwiftUI

struct LoggedUserView: View {
    
    @ObservedObject var vm: ProfileVM
    
    var body: some View {
        VStack {
            UserPhotoView()
            
            Form {
                Section(header: Text("Name")) {
                    Text(vm.nameUser)
                    HStack {
                        TextField("Enter new name...", text: $vm.profile.renameTextField)
                        Button(action: {
                            vm.nameUser = vm.profile.renameTextField
                            vm.profile.renameTextField = ""
                        }, label: {
                            HStack {
                                Spacer()
                                Text(vm.nameUser.isEmpty ? "Add Name" : "Rename")
                                Image(systemName: vm.nameUser.isEmpty ? "text.badge.plus" : "text.redaction")
                                
                            }
                        })
                    }
                }
                
                Section(header: Text("Email")) {
                    Text(vm.emailUser)
                }
                
                // MARK: - Button Reset Password
                ButtonResetPasswordView()
            }
            
            // MARK: - Button Log Out
            ButtonLoggedLogOutView(vm: vm)
        }
    }
}











struct LoggedUserView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoggedUserView(vm: ProfileVM())
            LoggedUserView(vm: ProfileVM())
                .preferredColorScheme(.dark)
        }
    }
}




struct ButtonResetPasswordView: View {
    var body: some View {
        Section(header: Text("Reset your password")) {
            Button(action: {
                // cod
            }, label: {
                HStack {
                    Spacer()
                    Text("Reset Password")
                    Image(systemName: "ellipsis.rectangle")
                    Spacer()
                }
                .foregroundColor(Color(.systemRed))
                .font(.headline)
            })
        }
    }
}

struct ButtonLoggedLogOutView: View {
    
    @ObservedObject var vm: ProfileVM
    @State private var showActionSheet = false
    
    var body: some View {
        HStack {
            Text("log out and delete name?")
                .foregroundColor(Color(.systemGray3))
            Button(action: {
                //vm.signOut()
                showActionSheet.toggle()
            }, label: {
                HStack {
                    Text("Log Out")
                    Image(systemName: "person.badge.minus")
                }
                .foregroundColor(Color(.systemRed))
                .padding()
            })
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("Log out of your account?"), message: Text("When you exit, the user's information will be deleted!"), buttons: [.cancel(), .destructive(Text("Log Out and Delete"), action: {
                    vm.signOut()
                })])
            }
        }
        
    }
}
