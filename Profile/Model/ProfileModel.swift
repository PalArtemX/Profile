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
    var nameTextField = ""
    var lastNameTextField = ""
    var emailTextField = ""
    var passwordSecureField = ""
    var passwordAgainSecureField = ""
    var isValid = false
    
    var imageUser: Image?
    
    // MARK: - LoginView
    var emailLoginTextField = ""
    var passwordLoginTextField = ""
    
    
    
    // MARK: - HomeTabView
    var curentTabView: Int
}
