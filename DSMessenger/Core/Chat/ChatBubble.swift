//
//  ChatBubble.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 22.08.2023.
//

import SwiftUI

struct ChatBubble: Shape {
    let isFromCurrentUser: Bool
    func path(in rect: CGRect) -> Path {
        
        let radius = CGSize(width: 16, height: 16)
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topLeft,
                                                    .topRight,
                                                    isFromCurrentUser ? .bottomLeft : .bottomRight],
                                cornerRadii: radius)
        return Path(path.cgPath)
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(isFromCurrentUser: true)
    }
}
