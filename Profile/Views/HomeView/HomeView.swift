//
//  HomeView.swift
//  Profile
//
//  Created by Artem Palyutin on 15.08.2021.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var curentTabView: Int
    
    var body: some View {
        VStack {
            Button(action: {
                curentTabView = 3
            }, label: {
                Text("go to profile")
        })
            
            Button(action: {
                curentTabView = 1
            }, label: {
                Text("go to 1")
            })
            
            Button(action: {
                curentTabView = 2
            }, label: {
                Text("go to 2")
                    
            })
        }
    }
}











struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(curentTabView: .constant(2))
    }
}
