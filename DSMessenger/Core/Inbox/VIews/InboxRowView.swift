//
//  InboxRowView.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 12.08.2023.
//

import SwiftUI

struct InboxRowView: View {
    let message: Message
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            CircleProfileImageView(user: message.user, size: .medium)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(message.user?.fullName ?? "")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(message.messageText)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(width: UIScreen.main.bounds.width - 220, alignment: .leading)
            }
            HStack {
                Text("Yesterday")
                Image(systemName: "chevron.right")
            }
            .font(.caption)
            .foregroundColor(.gray)
        }
        .frame(height: 72)
    }
}

//struct InboxRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        InboxRowView()
//    }
//}
