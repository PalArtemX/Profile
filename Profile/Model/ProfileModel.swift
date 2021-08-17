//
//  ProfileModel.swift
//  Profile
//
//  Created by Artem Palyutin on 15.08.2021.
//

import Foundation
import SwiftUI


struct ProfileModel {
    
    // MARK: - User
    var nameUser = ""
    var emailUser = ""
    var imageUser: Image?
    var renameTextField = ""
    
    // MARK: - User Firebase
    var email = ""
    var password = ""
    
    // MARK: - Firebase
    var signedIn = false // fix
    
    // MARK: - HomeTabView
    var curentTabView: Int
    
}
