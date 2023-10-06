//
//  InboxViewModel.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 11.09.2023.
//

import Combine
import Firebase

@MainActor
class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var recentMessages = [Message]()
    
    private var cancellables = Set<AnyCancellable>()
    private let inboxService = InboxService()
    
    init() {
        setupSubscribers()
        inboxService.observeRecentMessages()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
        
        inboxService.$documentChanges.sink { [weak self] changes in
            self?.loadInitMessages(from: changes)
        }.store(in: &cancellables)
    }
    
    private func loadInitMessages(from changes: [DocumentChange]) {
        var messages = changes.compactMap {
            try? $0.document.data(as: Message.self)
        }
        for i in 0 ..< messages.count {
            let message = messages[i]
            UserService.fetchUser(with: message.chatPartnerId) { user in
                messages[i].user = user
                self.recentMessages.append(messages[i])
            }
        }
    }
}
