//
//  ContentView.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 03.08.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ProfileView(user: User.mockUser)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
