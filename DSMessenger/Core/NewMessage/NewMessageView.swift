//
//  NewMessageView.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 13.08.2023.
//

import SwiftUI

struct NewMessageView: View {
    @State private var searchText = ""
    @Environment(\.dismiss) var dismissAction
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("To:", text: $searchText)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(8)
                    .padding()
                Text("Contacts")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                ForEach(0 ... 10, id: \.self) { user in
                    HStack {
                        CircleProfileImageView(user: User.mockUser, size: .small)
                        Text("Laura Palmer")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.leading)
                    
                    Divider()
                        .padding(.leading, 40)
                }
            }
            .navigationTitle("New message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismissAction()
                    }
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NewMessageView()
        }
    }
}
