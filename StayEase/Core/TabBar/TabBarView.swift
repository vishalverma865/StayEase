//
//  TabBarView.swift
//  StayEase
//
//  Created by Vishal Verma on 2024-03-01.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem { Label("Explore",systemImage: "magnifyingglass") }
            Wishlists()
                .tabItem { Label("Wishlists",systemImage: "heart") }
            ProfileView()
                .tabItem { Label("Explore",systemImage: "person.fill") }
        }
    }
}

#Preview {
    TabBarView()
}
