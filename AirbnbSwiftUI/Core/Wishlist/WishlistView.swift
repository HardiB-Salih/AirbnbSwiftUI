//
//  WishlistView.swift
//  AirbnbSwiftUI
//
//  Created by HardiB.Salih on 6/14/24.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading, spacing: 32){
                
                VStack (alignment: .leading, spacing: 4) {
                    Text("Log in to view your wishlists").semibold()
                    Text("You can create, view or edit wishlists once you;ve logged in")
                }
                

                Button {
                    print("Login")
                } label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .subheadline()
                        .semibold()
                        .padding()
                        .frame(width: 360, height: 48)
                        .background(Color(.systemPink))
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlist")
        }
    }
}

#Preview {
    WishlistView()
}
