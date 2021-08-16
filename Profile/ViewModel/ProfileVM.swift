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
    
    @Published var profile = ProfileModel(curentTabView: 0)
    @Published var signedIn = false
    
    var isSingnedIn: Bool {
        return Auth.auth().currentUser != nil
    }
    
    
    // MARK: - func
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.signedIn = true
            }
            
        }
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        
        self.signedIn = false
    }
    
    
}
