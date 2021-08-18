//
//  UserPhotoView.swift
//  Profile
//
//  Created by Artem Palyutin on 18.08.2021.
//

import SwiftUI

struct UserPhotoView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.fill.viewfinder")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 100)
                .padding()
            
            Button(action: {
                // cod
            }, label: {
                HStack {
                    Text("Add a Photo")
                    Image(systemName: "person.fill.viewfinder")
                }
            })
        }
    }
}











struct UserPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        UserPhotoView()
    }
}
