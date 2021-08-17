//
//  ProfileModel.swift
//  Profile
//
//  Created by Artem Palyutin on 15.08.2021.
//

import Foundation
import SwiftUI


struct ProfileModel {
    
    // MARK: - RegistrationView
    //var nameTextField = ""
    //var lastNameTextField = ""
    //var emailSignUp = ""
    //var passSignUp = ""
    //var passwordAgainSecureField = ""
    
    var signedIn = false
    
    var imageUser: Image?
    
    // MARK: - LoginView
    var email = ""
    var password = ""
    
    
    
    // MARK: - HomeTabView
    var curentTabView: Int
}
