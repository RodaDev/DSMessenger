//
//  ChatService.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 24.09.2023.
//

import Foundation
import Firebase

struct ChatService {
    
    let chatPartner: User
    
    func sendMessage(_ messageText: String) {
        guard let currentUId = Auth.auth().currentUser?.uid else {
            return
        }
        let chatPartnerId = chatPartner.id
        let currentUserRef = Constants.firestore.messagesCollection
            .document(currentUId)
            .collection(chatPartnerId)
            .document()
        let chatPartnerRef = Constants.firestore.messagesCollection.document(chatPartnerId).collection(currentUId)
        let messageId = currentUserRef.documentID
        let message = Message(messageId: messageId,
                              fromId: currentUId,
                              toId: chatPartnerId,
                              messageText: messageText,
                              timestamp: Timestamp())
        guard let messageData = try? Firestore.Encoder().encode(message) else {
            return
        }
        currentUserRef.setData(messageData)
        chatPartnerRef.document(messageId).setData(messageData)
    }
    
    func observeMessages(completion: @escaping ([Message]) -> Void) {
        guard let currentUId = Auth.auth().currentUser?.uid else {
            return
        }
        let chatPartnerId = chatPartner.id
        let query = Constants.firestore.messagesCollection
            .document(currentUId)
            .collection(chatPartnerId)
            .order(by: "timestamp",
                   descending: false)
        query.addSnapshotListener { snapshot, error in
            let changes = snapshot?.documentChanges.filter ({ $0.type == .added })
            guard let unwrChanges = changes else {
                return
            }
            var messages = unwrChanges.compactMap({ try? $0.document.data(as: Message.self) })
            for (index, message) in messages.enumerated() where message.fromId != currentUId {
                messages[index].user = chatPartner
            }
            completion(messages)
        }
    }
}
