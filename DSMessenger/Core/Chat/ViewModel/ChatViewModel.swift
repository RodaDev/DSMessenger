//
//  ChatViewModel.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 14.09.2023.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func sendMessage() {
        MessageService.sendMessage(messageText, to: user)
    }
}
