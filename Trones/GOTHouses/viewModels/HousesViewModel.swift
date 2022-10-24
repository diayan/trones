//
//  HouseViewModel.swift
//  Trones
//
//  Created by diayan siat on 24/10/2022.
//

import Foundation

protocol HousesFetcher {
    func fetchAnimals(page: Int) async -> [House]
}

//protocol HouseStore {
//    func save(animals: [House]) async throws
//}

///final is a compiler optimizer for speeding up builds
final class HousesViewModel: ObservableObject {
    
    @Published var isLoading: Bool ///track the state of the view state
    @Published var hasMoreAnimals = true
    private let houseFetcher: HousesFetcher
    private (set) var page = 1
    

    init(isLoading: Bool, hasMoreAnimals: Bool = true, houseFetcher: HousesFetcher, page: Int = 1) {
        self.isLoading = isLoading
        self.hasMoreAnimals = hasMoreAnimals
        self.houseFetcher = houseFetcher
        self.page = page
    }
    
}
