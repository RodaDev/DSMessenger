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
    
    let service: ChatService
    
    init(user: User) {
        self.service = ChatService(chatPartner: user)
        observeMessages()
    }
    
    func observeMessages() {
        service.observeMessages { addedMessages in
            self.messages.append(contentsOf: addedMessages)
        }
    }
    
    func sendMessage() {
        service.sendMessage(messageText)
    }
}
