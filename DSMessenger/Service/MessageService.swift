//
//  MessageService.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 13.09.2023.
//

import Foundation
import Firebase

struct MessageService {
    
    private static let messagesCollection = Firestore.firestore().collection("messages")
    
    static func sendMessage(_ messageText: String, to toUser: User) {
        guard let currentUId = Auth.auth().currentUser?.uid else {
            return
        }
        let chatPartnerId = toUser.id
        let currentUserRef = messagesCollection
            .document(currentUId)
            .collection(chatPartnerId)
            .document()
        let chatPartnerRef = messagesCollection.document(chatPartnerId).collection(currentUId)
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
    
    static func observeMessages(chatPartner: User, completion: @escaping ([Message]) -> Void) {
        guard let currentUId = Auth.auth().currentUser?.uid else {
            return
        }
        let chatPartnerId = chatPartner.id
        let query = messagesCollection
            .document(currentUId)
            .collection(chatPartnerId)
            .order(by: "timestamp",
                   descending: false)
        query.addSnapshotListener { snapshot, error in
            let changes = snapshot?.documentChanges.filter ({ $0.type == .added })
            guard let unwrChanges = changes else {
                return
            }
            guard var messages = changes?.compactMap({ try? $0.document.data(as: Message.self) }) else { return }
            for (index, message) in messages.enumerated() where message.fromId != currentUId {
                messages[index].user = chatPartner
            }
            completion(messages)
        }
    }
}
