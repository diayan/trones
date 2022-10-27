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
    @Published var hasMoreHouses = true
    @Published var houses: [House] = []
    private let houseFetcher: HousesFetcher

    init(isLoading: Bool = true, hasMoreHouses: Bool = true, houseFetcher: HousesFetcher, page: Int = 1) {
        self.isLoading = isLoading
        self.hasMoreHouses = hasMoreHouses
        self.houseFetcher = houseFetcher
        self.page = page
    }
    
    func fetchGOTHouses() async{
        let houses = await houseFetcher.fetchHouses(page: page)
        self.houses += houses
        isLoading = false
        hasMoreHouses = !houses.isEmpty
    }
    
    func fetchMoreHouses() async {
        page += 1
        await fetchGOTHouses()
    }
}
