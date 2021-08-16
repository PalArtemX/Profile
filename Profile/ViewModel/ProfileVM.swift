//
//  ProfileVM.swift
//  Profile
//
//  Created by Artem Palyutin on 15.08.2021.
//

import Foundation
import Firebase
import FirebaseAuth


class ProfileVM: ObservableObject {
    
    @Published var profile = ProfileModel(curentTabView: 0)
    
    
    func signInWithEmail(email: String, password: String, complection: @escaping (Bool, String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (response, error) in
            if error != nil {
                complection(false, (error?.localizedDescription)!)
                return
            }
            complection(true,(response?.user.email)!)
        }
    }
    
    
    func signUoWithEmail(email: String, password: String, complection: @escaping (Bool, String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (response, error) in
            if error != nil {
                complection(false,(error?.localizedDescription)!)
                return
            }
            complection(true,(response?.user.email)!)
        }
    }
    
}
