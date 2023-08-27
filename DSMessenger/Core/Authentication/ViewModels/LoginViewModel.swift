//
//  LoginViewModel.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 27.08.2023.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
}
