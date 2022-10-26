//
//  RequestManagerTests.swift
//  TronesTests
//
//  Created by diayan siat on 26/10/2022.
//

import XCTest
@testable import Trones

class RequestManagerTests: XCTestCase {
    private var requestManager: RequestManagerProtocol?
    
    override func setUp() {
        super.setUp()
        
        ///get reference to a userdefault
        guard let userDefaults = UserDefaults(suiteName: #file) else {
            return
        }
        /// and remove all it's content, to get  a fresh instance of RequestManager each time the tests are run
        userDefaults.removePersistentDomain(forName: #file)
        
        requestManager = RequestManager(apiManager: APIManagerMock())
    }
    
    
    func testRequestHouses() async throws {
        guard let houses: [House] = try await requestManager?.perform(HousesRequestMock.getHouses) else {
            XCTFail("Didn't get data from the request manager")
            return
        }
        
        let first = houses.first
        let last = houses.last
        
        XCTAssertEqual(first?.name, "House Algood")
        XCTAssertEqual(first?.region, "The Westerlands")

        XCTAssertEqual(last?.name, "House Baelish of Harrenhal")
        XCTAssertEqual(last?.region, "The Riverlands")
    }
}
