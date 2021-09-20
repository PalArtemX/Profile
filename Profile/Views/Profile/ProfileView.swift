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
                LoggedUserView(vm: vm)
            } else {
                LoginView(vm: vm)
            }
        }
        .onAppear {
            vm.profile.signedIn = vm.isSignedIn
        }
    }
}











struct PrifileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(vm: ProfileVM())
    }
}
