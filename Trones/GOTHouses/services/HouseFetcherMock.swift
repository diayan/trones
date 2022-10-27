//
//  HouseFetcherMock.swift
//  Trones
//
//  Created by diayan siat on 27/10/2022.
//

import Foundation

struct HouseFetcherMock: HousesFetcher {
    func fetchHouses(page: Int) async -> [House] {
        House.houses
    }
}
