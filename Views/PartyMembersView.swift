//
//  PartyMembersView.swift
//  FinnishParliaments
//
//  Created by Berhanu Muche on 11.11.2024.
//
import SwiftUI

struct PartyMembersView: View {
    @EnvironmentObject var modelData: ModelData
    var partyName: String  // The name of the selected party
    
    var body: some View {
        let members = modelData.membersByParty[partyName] ?? []
        
        // Display the list of members for the selected party
        List(members) { member in
            NavigationLink(destination: MPs_Detail(member: member)) {
                MPs_Row(member: member, favorites: $modelData.favoriteMembers)
            }
        }
        .navigationTitle("\(partyName) Members")
    }
}
