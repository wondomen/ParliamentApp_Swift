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
            // Display favorite parties with logo
            if !modelData.favoriteParties.isEmpty {
                Section(header: Text("Favorite Parties")) {
                    ForEach(modelData.favoriteParties.sorted(), id: \.self) { party in
                        HStack {
                            // Display party logo from assets (same as MPs_Row)
                            Image(party)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4)) 
                            Text(modelData.membersByParty[party]?.first?.fullPartyName ?? party) // Display party name
                                .font(.headline)
                        }
                    }
                }
            }

            // Display favorite MPs using MPs_Row
            if !modelData.favoriteMembers.isEmpty {
                Section(header: Text("Favorite Members")) {
                    ForEach(modelData.members.filter { modelData.favoriteMembers.contains($0.id) }) { member in
                        MPs_Row(member: member, favorites: $modelData.favoriteMembers)
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Favorites")
    }
}
