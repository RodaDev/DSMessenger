//
//  ActiveNowUsersView.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 09.08.2023.
//

import SwiftUI

struct ActiveNowUsersView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 32) {
                ForEach(0 ... 10, id: \.self) { user in
                    VStack {
                        ZStack(alignment: .bottomTrailing) {
                            // image
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 64, height: 64)
                                .foregroundColor(Color(.systemGray4))
                            // online indicator
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 18, height: 18)
                                Circle()
                                    .fill(.green)
                                    .frame(width: 12, height: 12)
                            }
                        }
                        
                        Text("Dale")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
        }
        .frame(height: 106)
    }
}

struct ActiveNowUsersView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveNowUsersView()
    }
}
