//
//  ProfileView.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 13.08.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            
            // header
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(Color(.systemGray4))
            Text("Dale Cooper")
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
        ProfileView()
    }
}
