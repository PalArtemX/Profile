//
//  UserPhotoView.swift
//  Profile
//
//  Created by Artem Palyutin on 18.08.2021.
//

import SwiftUI

struct UserPhotoView: View {
    
    @State private var isShowing = false
    @State private var avatarImage = UIImage(named: "avatar")!
    
    
    var body: some View {
        VStack {
            Image(uiImage: avatarImage)
                .resizable()
                .scaledToFit()
                .clipShape(Circle(), style: FillStyle())
                .frame(maxHeight: 100)
            
            Button(action: {
                isShowing.toggle()
            }, label: {
                HStack {
                    Text("Add a Photo")
                    Image(systemName: "person.fill.viewfinder")
                }
            })
        }
        .sheet(isPresented: $isShowing, content: {
            PhotoPicker(avatarImage: $avatarImage)
        })
    }
}











struct UserPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserPhotoView()
                .previewLayout(.sizeThatFits)
            UserPhotoView()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
    }
}
