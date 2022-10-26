//
//  HousesRequestMock.swift
//  TronesTests
//
//  Created by diayan siat on 26/10/2022.
//

import Foundation
@testable import Trones

enum HousesRequestMock: RequestProtocol{
    case getHouses

    var requestType: RequestType {
        .GET
    }
    
    ///read mock data from resource file, if not return an empty string
    var path: String {
        guard let path = Bundle.main.path(
            forResource: "HousesMock", ofType: "json")
        else { return "" }
        return path
    }
    
}
