//
//  InboxView.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 09.08.2023.
//

import SwiftUI

struct InboxView: View {
    @State private var isShowingMessgaeView: Bool = false
    @StateObject var viewModel = InboxViewModel()
    @State private var selectedUser: User?
    @State private var isShawnChat = false
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                ActiveNowUsersView()
                List {
                    ForEach(0 ... 10, id: \.self) { message in
                        InboxRowView()
                    }
                }
                .menuIndicator(Visibility.hidden)
                .listStyle(PlainListStyle())
                .frame(height: UIScreen.main.bounds.height - 120,
                       alignment: .center)
            }
            .onChange(of: selectedUser, perform: { user in
                isShawnChat = user != nil
            })
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationDestination(isPresented: $isShawnChat, destination: {
                if let user = selectedUser {
                    ChatView(user: user)
                }
            })
            .fullScreenCover(isPresented: $isShowingMessgaeView, content: {
                NewMessageView(selectedUser: $selectedUser)
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        NavigationLink(value: viewModel.currentUser) {
                            CircleProfileImageView(user: viewModel.currentUser, size: .xSmall)
                        }
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingMessgaeView.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(.systemGray5))
                    }
                }
            }
        }
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}
