//
//  User.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 15.08.2023.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id = UUID().uuidString
    let fullName: String
    let email: String
    let profileImageUrl: String?
    
}

extension User {
    static let mockUser = User(fullName: "Dale Cooper", email: "coop@fbi.com", profileImageUrl: "Agentdalecooper")
}
