//
//  MPs_Detail.swift
//  FinnishParliaments
//
//  Created by Berhanu Muche on 4.11.2024.
//

import SwiftUI

struct MPs_Detail: View {
    var member: Member

    var body: some View {
        ScrollView {
            // Display the party logo from the asset catalog
            Image(member.party) // Use party name to fetch the logo from asset catalog
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .clipShape(Circle()) // Makes the image circular
                .overlay(Circle().stroke(Color.white, lineWidth: 4)) // Optional: Add border around the image
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Parliament Member")
                        .font(.title)
                    Spacer()
                    
                    Text("Party")
                        .font(.title)
                }
                
                // Name and Party Section
                HStack {
                    Text("\(member.first), \(member.last)")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    
                    Spacer()
                    
                    // Display the full party name instead of shorthand
                    Text(member.fullPartyName)  // Displaying the full name of the party
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                // Ministerial Status Section
                if member.minister {
                    HStack {
                        Image(systemName: "crown.fill") // Icon to represent minister status
                            .foregroundColor(.blue)
                        Text("Minister")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                    .padding(.vertical, 4)
                }
                
                Divider()
                
                // Biography Section
                Text("About \(member.first), \(member.last)")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("\(member.first) was born in \(member.bornYear) and is a member of the \(member.fullPartyName) party, representing \(member.constituency) with seat number \(member.seatNumber).")
                
                Divider()
                
                // Twitter Link Section (if available)
                if let twitterURL = URL(string: member.twitter), !member.twitter.isEmpty {
                    Link(destination: twitterURL) {
                        HStack {
                            Image(systemName: "link") // Link icon
                            Text("Twitter Profile")
                        }
                        .font(.headline)
                        .foregroundColor(.blue)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("\(member.last), \(member.first)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

