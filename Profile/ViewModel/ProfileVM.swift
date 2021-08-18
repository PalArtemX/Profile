//
//  ProfileVM.swift
//  Profile
//
//  Created by Artem Palyutin on 15.08.2021.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseCore
import SwiftUI

class ProfileVM: ObservableObject {
    // MARK: - Model
    @Published var profile = ProfileModel(curentTabView: 0)
    
    // MARK: - UserDefaults
    @AppStorage("name_user") var nameUser = ""
    @AppStorage("email_user") var emailUser = ""
    
    
    
    
    
    // MARK: - Firebase
    var isSingnedIn: Bool {
            return Auth.auth().currentUser != nil
        }
    // MARK: func Firebase
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else { return }
            DispatchQueue.main.async {
                self?.profile.signedIn = true
            }
        }
        saveUserProfile(email: email)
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else { return }
            DispatchQueue.main.async {
                self?.profile.signedIn = true
            }
        }
        saveUserProfile(email: email)
        
        profile.password = ""
        profile.email = ""
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.profile.signedIn = false
        removeUserProfile()
    }
    
    
    // MARK: - func
    func saveUserProfile(email: String) {
        nameUser = profile.nameUser
        emailUser = email
    }
    
    func removeUserProfile() {
        nameUser = ""
        emailUser = ""
    }
    
    func inputChecks() {
        guard !profile.email.isEmpty else {
            print("email Is Empty")
            return
        }
        guard profile.password.count >= 6 else {
            print("password < 6")
            return
        }
        guard profile.password == profile.passwordCheck else {
            print("passwords don't match ")
            return
        }
        
    }
    
}







