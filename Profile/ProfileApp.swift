//
//  ProfileApp.swift
//  Profile
//
//  Created by Artem Palyutin on 15.08.2021.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore

@main
struct ProfileApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeTabView()
        }
    }
}
