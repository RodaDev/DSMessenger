//
//  CircleProfileImageView.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 21.08.2023.
//

import SwiftUI

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 56
        case .large: return 64
        case .xLarge: return 80
        }
    }
}

struct CircleProfileImageView: View {
    let user: User
    let size: ProfileImageSize
    
    var body: some View {
        
        if let imageUrl = user.profileImageUrl {
            Image(imageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundColor(Color(.systemGray4))
        }
    }
}

struct CircleProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProfileImageView(user: User.mockUser, size: .medium)
    }
}
