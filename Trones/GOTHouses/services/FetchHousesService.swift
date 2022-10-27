//
//  FetchHousesService.swift
//  Trones
//
//  Created by diayan siat on 27/10/2022.
//

import Foundation

struct FetchHousesService {
  private let requestManager: RequestManagerProtocol

  init(requestManager: RequestManagerProtocol) {
    self.requestManager = requestManager
  }
}

extension FetchHousesService: HousesFetcher {
    func fetchHouses(page: Int) async -> [House] {
        let requestData = HousesRequest.getHousesWith(page: page, pageSize: 50)
        
        do {
            let houses: [House] = try await
            requestManager.perform(requestData)
            return houses
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
