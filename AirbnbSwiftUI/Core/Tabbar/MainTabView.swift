//
//  MainTabView.swift
//  AirbnbSwiftUI
//
//  Created by HardiB.Salih on 6/14/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
                .tag(0)
            
            
            WishlistView()
                .tabItem { Label("Explore", systemImage: "suit.heart.fill") }
                .tag(1)
            
            
            ProfileView()
                .tabItem { Label("Explore", systemImage: "person.crop.circle.fill") }
                .tag(2)
        }
        .tint(.secondary)
    }
}

#Preview {
    MainTabView()
}
