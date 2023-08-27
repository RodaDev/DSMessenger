//
//  ContentView.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 03.08.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        
        Group {
            if viewModel.userSession != nil {
                InboxView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
