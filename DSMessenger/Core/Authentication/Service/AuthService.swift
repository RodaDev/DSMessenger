//
//  AuthService.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 27.08.2023.
//

import Foundation
import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        print("DEBUG: User session id = \(userSession?.uid ?? "-")")
    }
    
    func login(email: String, password: String) async throws {
        print("DEBUG login with: \(email), pass: \(password)")
    }
    
    func createUser(email: String, password: String, fullName: String) async throws {
        
        do {
            // Firebase Auth.auth()
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG create user with result id: \(result.user.uid)")
        } catch {
            print("DEBUG fail creating user error: \(error.localizedDescription)")
        }
        
        print("DEBUG createUser with: \(email), pass: \(password), fullName: \(fullName)")
    }
}
