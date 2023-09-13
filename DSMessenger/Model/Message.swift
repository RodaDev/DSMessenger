//
//  Message.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 13.09.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable, Codable, Hashable {
    @DocumentID var messageId: String?
    let fromId: String
    let toId: String
    let messageText: String
    let timestamp: Timestamp
    
    var user: User?
    
    // Identifiable
    var id: String {
        return messageId ?? NSUUID().uuidString
    }
    
    
    var isFromCurrentUser: Bool {
        return fromId == Auth.auth().currentUser?.uid
    }
    
    var chatPartnerId: String {
        return isFromCurrentUser ? toId : fromId
    }
}

