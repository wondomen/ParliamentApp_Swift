//
//  MPs_Row.swift
//  FinnishParliaments
//
//  Created by Berhanu Muche on 3.11.2024.
//

import SwiftUI

struct MPs_Row: View {
    var member: Member
    @Binding var favorites: Set<Int>
    
    var isFavorite: Bool {
        favorites.contains(member.id)
    }
    
    var body: some View {
        HStack {
            // Display the party logo from the asset catalog
            Image(member.party) // Use party name to fetch the logo from asset catalog
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(Circle()) // Makes the image circular
                .overlay(Circle().stroke(Color.white, lineWidth: 4)) // Optional: Add border around the image
            
            // Display name and party information
            VStack(alignment: .leading) {
                Text("\(member.first) \(member.last)")
                    .font(.headline)
                Text(member.fullPartyName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // Favorite button
            Button(action: {
                if isFavorite {
                    favorites.remove(member.id)
                } else {
                    favorites.insert(member.id)
                }
            }) {
                Image(systemName: isFavorite ? "star.fill" : "star")
                    .foregroundColor(isFavorite ? .yellow : .gray)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding(.vertical, 4)
    }
}
