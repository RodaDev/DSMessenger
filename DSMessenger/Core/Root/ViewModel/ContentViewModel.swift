//
//  ContentViewModel.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 27.08.2023.
//

import Firebase
import Combine

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupAuthSubscribers()
    }
    
    // some Combine staff
    private func setupAuthSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSessionFromFireBaseAuth in
            self?.userSession = userSessionFromFireBaseAuth
        }
        .store(in: &cancellables)
    }
}
