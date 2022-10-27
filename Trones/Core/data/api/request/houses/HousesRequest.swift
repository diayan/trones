//
//  HousesRequest.swift
//  Trones
//
//  Created by diayan siat on 22/10/2022.
//

import Foundation

enum HousesRequest: RequestProtocol {
    case getHousesWith(page: Int, pageSize: Int?)
    //case getHouseWith(name: String)
    
    var path: String {
        "/api/houses"
    }
        
    var urlParams: [String : String?] {
        switch self {
        case let .getHousesWith(page: page, pageSize: pageSize):
            var params = ["page": String(page)]
            if let pageSize = pageSize {
                params["pageSize"] = String(pageSize)
            }
            return params
//        case let .getHouseWith(name: name):
//            var params = ["name": String(name)]
//            return params
        }
    }
    
    var addAuthorizationToken: Bool {
        false
    }
    
    var requestType: RequestType {
        .GET
    }
}

