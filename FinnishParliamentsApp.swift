//
//  FinnishParliamentsApp.swift
//  FinnishParliaments
//
//  Created by Berhanu Muche on 3.11.2024.
//

import SwiftUI

@main
struct FinnishParliamentsApp: App {
    @StateObject private var modelData = ModelData() // Ensure it's a StateObject

    var body: some Scene {
        WindowGroup {
            TabView {
                PartySelectionView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }

                FavoriteMPsView()
                    .tabItem {
                        Label("Favorites", systemImage: "star.fill")
                    }

                MPs_List()
                    .tabItem {
                        Label("Preferences", systemImage: "list.bullet")
                    }
            }
            .environmentObject(modelData) // Make sure to pass it down the environment
        }
    }
}
