//
//  ProfileView.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 13.08.2023.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var user: User
    
    var body: some View {
        VStack {
            
            // header
            
            PhotosPicker(selection: $viewModel.selectedItem) {
                
                if let profileImage = viewModel.profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                } else {
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                }
            }
            Text(user.fullName)
                .font(.title2)
                .fontWeight(.semibold)
            
            // list
            List {
                Section {
                    ForEach(SettingsOptionsViewModel.allCases) { option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(option.imageBackgroundColor)
                            Text(option.title)
                                .font(.subheadline)
                        }
                    }
                }
                
                Section {
                    Button("Log out") {
                        
                    }
                
                    Button ("Delete account") {
                        
                    }
                }
                .foregroundColor(.red)
               
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.mockUser)
    }
}
