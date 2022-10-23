//
//  HousesRequest.swift
//  Trones
//
//  Created by diayan siat on 22/10/2022.
//

import Foundation

enum HousesRequest: RequestProtocol {
    case getHousesWith(page: Int)

    var path: String {
        "/api/houses"
    }
    
    var addAuthorizationToken: Bool {
        false
    }
    
    var requestType: RequestType {
        .GET
    }
}

