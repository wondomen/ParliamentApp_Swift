//
//  MPsScheme.swift
//  FinnishParliaments
//
//  Created by Berhanu Muche on 3.11.2024.
//

import Foundation
import SwiftUI

struct Member: Hashable, Codable, Identifiable {
    var personNumber: Int
    var seatNumber: Int
    var last: String
    var first: String
    var party: String
    var picture: String
    var twitter: String
    var minister: Bool
    var bornYear: Int
    var constituency: String
    
    var id: Int {
        personNumber
    }
    
    var image: Image {
        Image(picture) // This assumes images are handled by URLs
    }

    // Computed property to map party codes to full names
    var fullPartyName: String {
        switch party {
        case "kesk": return "Keskusta"
        case "ps": return "Perussuomalaiset"
        case "sd": return "Social Democrats"
        case "kok": return "Kokoomus"
        case "r": return "RKP"
        case "vas": return "Vasemmistoliitto"
        case "vihr": return "Vihreät"
        case "kd": return "Kristillisdemokraatit"
        case "liik": return "Liike Nyt"
        default: return party
        }
    }
}
