//
//  ChatView.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 22.08.2023.
//

import SwiftUI

struct ChatView: View {
    
    @State private var messageText = ""
    var body: some View {
        VStack {
            ScrollView {
                // header
                CircleProfileImageView(user: User.mockUser, size: .xLarge)
                VStack(spacing: 4) {
                    Text("DaleCooper")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("Messanger")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                // messages
                
                ForEach(0 ... 15, id: \.self) { message in
                    CHatMessageCell(isFromCurrentUser: Bool.random())
                }
            }
            
            Spacer()
            
            // input view
            ZStack(alignment: .trailing) {
                TextField("Type message...", text: $messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button {
                    print("SendMessage")
                } label: {
                    Text("Send")
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
