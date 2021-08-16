//
//  ProfileVM.swift
//  Profile
//
//  Created by Artem Palyutin on 15.08.2021.
//

import Foundation


class ProfileVM: ObservableObject {
    
    @Published var profile = ProfileModel(curentTabView: 0)
    
    
}
