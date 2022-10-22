//
//  HouseMock.swift
//  Trones
//
//  Created by diayan siat on 22/10/2022.
//

import Foundation

private struct HousesMock: Codable {
    let houses: [House]
}

private func loadHouses() -> [House] {
    ///find and load data from a file called HousesMock with an extension json
    guard let url = Bundle.main.url(
        forResource: "HousesMock",
        withExtension: "json"
    ),
    let data = try? Data(contentsOf: url) else { return [] }
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase //convert keys stored as snake case into camel case
    let jsonMock = try? decoder.decode(HousesMock.self, from: data)
    return jsonMock?.houses ?? []
}

extension HousesMock {
    //expose this data to the rest of the app
    static let houses = loadHouses()
}
