//
//  ChatViewModel.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 14.09.2023.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    @Published var messages = [Message]()
    let user: User
    
    init(user: User) {
        self.user = user
        observeMessages()
    }
    
    func observeMessages() {
        MessageService.observeMessages(chatPartner: user) { addedMessages in
            self.messages.append(contentsOf: addedMessages)
        }
    }
    
    func sendMessage() {
        MessageService.sendMessage(messageText, to: user)
    }
}
