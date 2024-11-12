//
//  PartySelectionView.swift
//  FinnishParliaments
//
//  Created by Berhanu Muche on 11.11.2024.
//

import SwiftUI

struct PartySelectionView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var selectedParty: String? = nil  // Track the selected party

    var body: some View {
        NavigationView {
            VStack {
                // Title
                Text("Select a Party")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()

                // Grid of party buttons
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 20) {
                        // Iterate over all parties
                        ForEach(modelData.membersByParty.keys.sorted(), id: \.self) { party in
                            VStack {
                                NavigationLink(destination: PartyMembersView(partyName: party)) {
                                    VStack {
                                        // Display party logo from assets
                                        Image(party)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 60)
                                            .clipShape(Circle())
                                            .padding()

                                        Text(modelData.membersByParty[party]?.first?.fullPartyName ?? party)
                                            .foregroundColor(.black)
                                            .fontWeight(.bold)
                                            .font(.caption)
                                            .lineLimit(1)
                                    }
                                    .frame(width: 120, height: 120)
                                    .background(Color.blue.opacity(0.1))
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                }

                                // Favorite Star Button to mark party as favorite
                                Button(action: {
                                    if modelData.favoriteParties.contains(party) {
                                        modelData.favoriteParties.remove(party) // Remove from favorites
                                    } else {
                                        modelData.favoriteParties.insert(party) // Add to favorites
                                    }
                                }) {
                                    Image(systemName: modelData.favoriteParties.contains(party) ? "star.fill" : "star")
                                        .foregroundColor(modelData.favoriteParties.contains(party) ? .yellow : .gray)
                                        .font(.title2)
                                        .padding(.top, 5)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
