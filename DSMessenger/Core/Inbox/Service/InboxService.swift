//
//  InboxService.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 27.09.2023.
//

import Foundation
import Firebase

class InboxService {

    @Published var documentChanges = [DocumentChange]()
    
    func observeRecentMessages() {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let query = Constants.firestore.messagesCollection
            .document(uid)
            .collection(Constants.collectionName.recentMessages)
            .order(by: Constants.field.timestamp, descending: true)
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added || $0.type == .modified}) else {
                return
            }
            self.documentChanges = changes
        }
    }
    
}
