//
//  InboxViewModel.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 11.09.2023.
//

import Combine

@MainActor
class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}
