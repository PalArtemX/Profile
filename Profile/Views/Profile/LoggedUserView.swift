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
            
            // MARK: - Button Log Out
            HStack {
                Text("log out and delete name?")
                    .foregroundColor(Color(.systemGray3))
                Button(action: {
                    vm.signOut()
                }, label: {
                    HStack {
                        Text("Log Out")
                        Image(systemName: "person.badge.minus")
                    }
                    .foregroundColor(Color(.systemRed))
                                                .padding()
            })
            }
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
