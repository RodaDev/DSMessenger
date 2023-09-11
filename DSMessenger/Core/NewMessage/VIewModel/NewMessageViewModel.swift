//
//  NewMessageViewModel.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 12.09.2023.
//

import Foundation
import Firebase

class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    @MainActor
    func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return
        }
        users = try await UserService.shared.fetchAllUsers()
            .filter {
                $0.id != currentUid
            }
    }
}
