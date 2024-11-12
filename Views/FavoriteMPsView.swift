//
//  FavoriteMPsView.swift
//  FinnishParliaments
//
//  Created by Berhanu Muche on 11.11.2024.
//
import SwiftUI

struct FavoriteMPsView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        List {
            // Display favorite parties
            if !modelData.favoriteParties.isEmpty {
                Section(header: Text("Favorite Parties")) {
                    ForEach(modelData.favoriteParties.sorted(), id: \.self) { party in
                        Text(party)
                    }
                }
            }

            // Display favorite MPs without grouping by party
            if !modelData.favoriteMembers.isEmpty {
                Section(header: Text("Favorite Members")) {
                    ForEach(modelData.members.filter { modelData.favoriteMembers.contains($0.id) }) { member in
                        HStack {
                            Text("\(member.first) \(member.last)")
                        }
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Favorites")
    }
}

