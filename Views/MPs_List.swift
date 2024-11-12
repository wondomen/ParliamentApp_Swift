import SwiftUI

import SwiftUI

struct MPs_List: View {
    @EnvironmentObject private var modelData: ModelData  // Use EnvironmentObject instead of StateObject
    @State private var selectedParty: String? = nil

    // Filtered list based on favorite toggle and selected party
    var filteredMembers: [Member] {
        modelData.members.filter { member in
            (!modelData.showOnlyFavorites || modelData.favoriteMembers.contains(member.id)) &&
            (selectedParty == nil || member.party == selectedParty)
        }
    }

    var body: some View {
        NavigationSplitView {
            VStack {
                // Toggle to show only favorites
                Toggle("Show Only Favorites", isOn: $modelData.showOnlyFavorites)
                    .padding()

                // Picker for selecting a party
                Picker("Filter by Party", selection: $selectedParty) {
                    Text("All Parties").tag(String?.none)
                    ForEach(modelData.membersByParty.keys.sorted(), id: \.self) { partyKey in
                        Text(modelData.membersByParty[partyKey]?.first?.fullPartyName ?? partyKey)
                            .tag(partyKey as String?)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()

                // List of filtered members
                List(filteredMembers) { member in
                    NavigationLink {
                        MPs_Detail(member: member)
                    } label: {
                        MPs_Row(member: member, favorites: $modelData.favoriteMembers)
                    }
                }
                .navigationTitle("Members of Parliament")
            }
        } detail: {
            Text("Select an MP")
        }
    }
}
