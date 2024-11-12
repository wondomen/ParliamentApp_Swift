//
//  MPsByPartyView.swift
//  FinnishParliaments
//
//  Created by Berhanu Muche on 11.11.2024.
//

import SwiftUI

struct MPsByPartyView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.membersByParty.keys.sorted(), id: \.self) { party in
                    Section(header: Text(party)) {
                        ForEach(modelData.membersByParty[party] ?? []) { member in
                            NavigationLink(destination: MPs_Detail(member: member)) {
                                MPs_Row(member: member, favorites: $modelData.favoriteMembers)
                            }
                        }
                    }
                }
            }
            .navigationTitle("MPs by Party")
        }
    }
}
