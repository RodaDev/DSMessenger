//
//  UserService.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 10.09.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserService {
    
    @Published var currentUser: User?
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let snapShot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapShot.data(as: User.self)
        currentUser = user
        print("DEBUG: fetch user: \(String(describing: currentUser))")
    }
    
}
