//
//  MpsDataModel.swift
//  FinnishParliaments
//
//  Created by Berhanu Muche on 3.11.2024.
//

import Foundation
import SwiftUI

class ModelData: ObservableObject {
    @Published var members: [Member] = []
    @Published var favoriteMembers: Set<Int> = []
    @Published var favoriteParties: Set<String> = []
    @Published var showOnlyFavorites: Bool = false

    // Computed property to group members by party
    var membersByParty: [String: [Member]] {
        Dictionary(grouping: members, by: { $0.party })
    }

    init() {
        fetchMembers()
    }

    private func fetchMembers() {
        guard let url = URL(string: "https://users.metropolia.fi/~peterh/mps.json") else {
            fatalError("Invalid URL")
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let fetchedMembers = try decoder.decode([Member].self, from: data)
                    DispatchQueue.main.async {
                        self.members = fetchedMembers
                    }
                } catch {
                    print("Failed to decode JSON: \(error)")
                }
            }
        }.resume()
    }
}
