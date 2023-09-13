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
}
