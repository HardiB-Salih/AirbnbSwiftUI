//
//  ProfileView.swift
//  AirbnbSwiftUI
//
//  Created by HardiB.Salih on 6/14/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            //MARK: - Profile Login view
            VStack (alignment: .leading, spacing: 32){
                VStack {
                    Text("Profile")
                        .font(.largeTitle)
                        .semibold()
                    Text("Log in to start planning your next trip")
                }
                
                Button {
                    print("Login")
                } label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .subheadline()
                        .semibold()
                        .padding()
                        .frame(width: 360, height: 44)
                        .background(Color(.systemPink))
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                }
                
                HStack {
                    Text("Don't have an account? ") +
                    Text("Sign up").fontWeight(.semibold)
                }
                .footnote()
            }
            
            
            
            VStack(spacing: 24) {
                ProfileOptionRowView(title: "Setting", systemName: "gear")
                ProfileOptionRowView(title: "Accessibility", systemName: "gear")
                ProfileOptionRowView(title: "Visit the help center", systemName: "questionmark.circle")
            }
            .padding()
            
            
            
            
            
        }
        
        
    }
}

#Preview {
    ProfileView()
}

struct ProfileOptionRowView: View {
    let title: String
    let systemName: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: systemName)
                Text(title)
                    .subheadline()
                Spacer()
                Image(systemName: "chevron.right")
            }
            Divider()
        }
    }
}
