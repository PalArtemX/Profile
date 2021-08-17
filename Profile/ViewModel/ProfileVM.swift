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


class ProfileVM: ObservableObject {
    // Model
    @Published var profile = ProfileModel(curentTabView: 0)
    
    
    
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
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else { return }
            DispatchQueue.main.async {
                self?.profile.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.profile.signedIn = false
    }
    
    
}
