//
//  PreferencesView.swift
//  FinnishParliaments
//
//  Created by Berhanu Muche on 11.11.2024.
//
import SwiftUI

struct PreferencesView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showOnlyFavorites = false  // Local state to manage favorites view
    
    var body: some View {
        NavigationView {
            List {
                    NavigationLink(destination: MPs_List()) {
                        Label("MPs List", systemImage: "list.bullet")
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Preferences")
        }
    }


