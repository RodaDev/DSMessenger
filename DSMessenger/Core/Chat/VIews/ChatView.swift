//
//  ChatView.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 22.08.2023.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject var viewModel: ChatViewModel
    
    let user: User
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
        
    }
    var body: some View {
        VStack {
            ScrollView {
                // header
                CircleProfileImageView(user: user, size: .xLarge)
                VStack(spacing: 4) {
                    Text(user.fullName)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("Messanger")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                // messages
                
                ForEach(viewModel.messages) { message in
                    CHatMessageCell(message: message)
                }
            }
            
            Spacer()
            
            // input view
            ZStack(alignment: .trailing) {
                TextField("Type message...", text: $viewModel.messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button {
                    viewModel.sendMessage()
                    viewModel.messageText = ""
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
        ChatView(user: User.mockUser)
    }
}
