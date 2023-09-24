//
//  Constants.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 24.09.2023.
//

import Foundation
import Firebase

struct Constants {
    struct firestore {
        static let usersCollection = Firestore.firestore().collection("users")
        static let messagesCollection = Firestore.firestore().collection("messages")
    }
}
