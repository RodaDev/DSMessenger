//
//  CHatMessageCell.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 22.08.2023.
//

import SwiftUI

struct CHatMessageCell: View {
    let isFromCurrentUser: Bool
    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()
                Text("This is a test text message long long. How that will be?")
                    .font(.subheadline)
                    .padding()
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5,
                           alignment: .trailing)
            } else {
                HStack(alignment: .bottom, spacing: 8) {
                    CircleProfileImageView(user: User.mockUser, size: .xxSmall)
                    Text("This is a test text message, long long. How that will be? Is it ok or not?")
                        .font(.subheadline)
                        .padding()
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.75,
                               alignment: .leading)
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 8)
    }
}

struct CHatMessageCell_Previews: PreviewProvider {
    static var previews: some View {
        CHatMessageCell(isFromCurrentUser: false)
    }
}
