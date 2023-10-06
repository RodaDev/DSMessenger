//
//  Constants.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 24.09.2023.
//

import Foundation
import Firebase

struct Constants {
    private init() {}
    struct firestore {
        private init() {}
        static let usersCollection = Firestore.firestore().collection("users")
        static let messagesCollection = Firestore.firestore().collection("messages")
        
    }
    
    struct collectionName {
        private init() {}
        static let recentMessages = "recent-messages"
    }
    
    struct field {
        private init() {}
        static let timestamp = "timestamp"
    }
}
