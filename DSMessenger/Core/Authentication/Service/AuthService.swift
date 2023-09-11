//
//  AuthService.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 27.08.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        loadCurrentUserData()
        print("DEBUG: User session id = \(userSession?.uid ?? "-")")
    }
    
    @MainActor // to return to main thread afterwards
    func login(email: String, password: String) async throws {
        do {
            // Firebase Auth.auth()
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            userSession = result.user
            loadCurrentUserData()
            print("DEBUG signIn with result id: \(result.user.uid)")
        } catch {
            print("DEBUG fail login error: \(error.localizedDescription)")
        }
    }
    
    @MainActor // to return to main thread afterwards
    func createUser(email: String, password: String, fullName: String) async throws {
        
        do {
            // Firebase Auth.auth()
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
            try await uploadUserData(email: email, fullName: fullName, id: result.user.uid)
            loadCurrentUserData()
            print("DEBUG create user with result id: \(result.user.uid)")
        } catch {
            print("DEBUG fail creating user error: \(error.localizedDescription)")
        }
        
        print("DEBUG createUser with: \(email), pass: \(password), fullName: \(fullName)")
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            userSession = nil
            UserService.shared.currentUser = nil
        } catch {
            print("DEBUG error while signing out, error: \(error.localizedDescription)")
        }
    }
    
    private func uploadUserData(email: String, fullName: String, id: String) async throws {
        let user = User(fullName: fullName, email: email, profileImageUrl: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {
            return
        }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
    
    private func loadCurrentUserData() {
        Task {
            try await UserService.shared.fetchCurrentUser()
        }
    }
}
