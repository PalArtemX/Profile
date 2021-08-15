//
//  ProfileTabView.swift
//  Profile
//
//  Created by Artem Palyutin on 15.08.2021.
//

import SwiftUI

struct ProfileTabView: View {
    
    @State private var selectTabView = 0
    
    var body: some View {
        TabView(selection: $selectTabView){
            // View
            Text("Home")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home", comment: "TabView")
                }
                .tag(0)
            
            //View
            Text("Content")
                .tabItem {
                    Image(systemName: "circle.grid.cross.down.fill")
                    Text("content", comment: "TabView")
                }
                .tag(1)
            
            // View
            Text("Content")
                .tabItem {
                    Image(systemName: "circle.grid.cross.down.fill")
                    Text("content", comment: "TabView")
                }
                .tag(2)
            
            // View
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.crop.square")
                    Text("Profile", comment: "TabView")
                }
                .tag(3)
            
        }
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabView()
    }
}

