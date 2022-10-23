//
//  House.swift
//  Trones
//
//  Created by diayan siat on 22/10/2022.
//

import Foundation

struct House: Codable {
    var id: UUID? = UUID()
    let url: String?
    let name, region, coatOfArms, words: String?
    let titles, seats: [String?]?
    let currentLord, heir, overlord: String?
    let founded: String?
    let founder: String?
    let diedOut: String?
    let ancestralWeapons: [String?]?
    let cadetBranches, swornMembers: [String?]?
}


// MARK: -  conform to Identifiable
extension House: Identifiable {
}

