//
//  HouseViewModel.swift
//  Trones
//
//  Created by diayan siat on 24/10/2022.
//

import Foundation

protocol HousesFetcher {
    func fetchHouses(page: Int) async -> [House]
}

///final is a compiler optimizer for speeding up builds
@MainActor
final class HousesViewModel: ObservableObject {
    
    private (set) var page = 1
    @Published var isLoading: Bool ///track the state of the view state
    @Published var hasMoreAnimals = true
    @Published var houses: [House] = []
    private let houseFetcher: HousesFetcher

    init(isLoading: Bool = true, hasMoreAnimals: Bool = true, houseFetcher: HousesFetcher, page: Int = 1) {
        self.isLoading = isLoading
        self.hasMoreAnimals = hasMoreAnimals
        self.houseFetcher = houseFetcher
        self.page = page
    }
    
    func fetchGOTHouses() async{
        houses = await houseFetcher.fetchHouses(page: page)
        isLoading = false
    }
    
    func fetchMoreAnimals() async {
        page += 1
        await fetchGOTHouses()
    }
}
