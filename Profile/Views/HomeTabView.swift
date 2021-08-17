//
//  HomeTabView.swift
//  Profile
//
//  Created by Artem Palyutin on 15.08.2021.
//

import SwiftUI

struct HomeTabView: View {

    @StateObject var vm = ProfileVM()
    
    var body: some View {
        
        
        TabView(selection: $vm.profile.curentTabView){
            // MARK: - HomeView
            HomeView(vm: vm)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home", comment: "TabView")
                }
                .tag(0)
            
            // FIXME: - To create View 1
            Text("Content")
                .tabItem {
                    Image(systemName: "circle.grid.cross.down.fill")
                    Text("content", comment: "TabView")
                }
                .tag(1)
            
            // FIXME: - To create View 2
            Text("Content")
                .tabItem {
                    Image(systemName: "circle.grid.cross.down.fill")
                    Text("content", comment: "TabView")
                }
                .tag(2)
            
            // MARK: - ProfileView
            ProfileView(vm: vm)
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
        HomeTabView()
    }
}

