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
    var passwordCoupleSecureField = ""
    
    var imageUser: Image?
    
    // MARK: - LoginView
    var emailLoginTextField = ""
    var passwordLogonTextField = ""
    
    
    
    // MARK: - HomeTabView
    var curentTabView: Int
}
