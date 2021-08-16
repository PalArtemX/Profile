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
        LoginView(vm: vm)
    }
}











struct PrifileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(vm: ProfileVM())
    }
}
