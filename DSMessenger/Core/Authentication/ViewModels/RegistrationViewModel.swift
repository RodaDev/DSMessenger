//
//  RegistrationViewModel.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 27.08.2023.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, fullName: fullName)
    }
}
