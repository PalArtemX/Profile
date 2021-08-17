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
    //var nameTextField = ""
    //var lastNameTextField = ""
    //var emailSignUp = ""
    //var passSignUp = ""
    //var passwordAgainSecureField = ""
    
    
    var imageUser: Image?
    
    // MARK: - User Firebase
    var email = ""
    var password = ""
    
    // MARK: - Firebase
    var signedIn = false
    
    // MARK: - HomeTabView
    var curentTabView: Int
    
}
