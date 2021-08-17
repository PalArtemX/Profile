//
//  ProfileView.swift
//  Profile
//
//  Created by Artem Palyutin on 15.08.2021.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var vm: ProfileVM
    
    
    var body: some View {
        VStack {
            if vm.profile.signedIn {
                
                
                // FIXME: - create View
                VStack {
                    Text("Enter")
                    Button(action: {
                        vm.signOut()
                    }, label: {
                        Text("Sign Out")
                    })
                }
                
                
                
            } else {
                LoginView(vm: vm)
            }
        }
        .onAppear {
            vm.profile.signedIn = vm.isSingnedIn
        }
        
        
    }
}











struct PrifileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(vm: ProfileVM())
    }
}
