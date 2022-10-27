//
//  HouseTests.swift
//  TronesTests
//
//  Created by diayan siat on 27/10/2022.
//

import XCTest
@testable import Trones

@MainActor
final class HouseTests: XCTestCase {
    var viewModel: HousesViewModel!
    
    @MainActor
    override func setUp() {
        super.setUp()
        
        viewModel = HousesViewModel(
            isLoading: true,
            houseFetcher: HouseFetcherMock())
    }
    
    func testFetchHousesLoadingState() async {
        XCTAssertTrue(viewModel.isLoading, "The view model should be loading, but it isn't")
        await viewModel.fetchGOTHouses()
        XCTAssertFalse(viewModel.isLoading, "The view model should'nt be loading, but it is")
    }
    
    
    func testUpdatePageOnFetchMoreHouses() async {
        XCTAssertEqual(viewModel.page, 1, "the view model's page property should be 1 before fetching, but it's \(viewModel.page)")
        await viewModel.fetchMoreHouses()
        XCTAssertEqual(viewModel.page, 2, "the view model's page property should be 2 after fetching, but it's \(viewModel.page)")
    }
    
    func testFetchHousesEmptyResponse() async {
        viewModel = HousesViewModel(
            isLoading: true,
            houseFetcher: EmptyResponseHouseFetcherMock()
        )
        
        await viewModel.fetchGOTHouses()
        XCTAssertFalse(viewModel.hasMoreHouses, "hasMoreHouses should be false with an empty response, but it's true")
        XCTAssertFalse(viewModel.isLoading, "the view model shouldn't be loading after receiving an empty response, but it is")
    }
    
}

struct EmptyResponseHouseFetcherMock: HousesFetcher {
    func fetchHouses(page: Int) async -> [House] {
        return []
    }
}

