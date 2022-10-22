//
//  RequestProtocol.swift
//  Trones
//
//  Created by diayan siat on 22/10/2022.
//

import Foundation

protocol RequestProtocol {
    var path: String {get}
    var headers: [String: String] { get }
    var params: [String: Any] { get }
    var urlParams: [String: String?] { get }
    var addAuthorizationToken: Bool { get }
    var requestType: RequestType { get }
}

extension RequestProtocol {
    var host: String {
        APIConstants.host
    }
    
    ///Note this is default for apis that requires an auth token,
    ///set it to false when performing a request to iceandfire api
    var authorizationToken: Bool {
        true
    }
    var params: [String : Any] {
        [:]
    }
    var urlParams: [String : String?] {
        [:]
    }
    var headers: [String : String] {
        [:]
    }
    
    func createUrlRequest(authToken: String) throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        
        if !urlParams.isEmpty {
            urlComponents.queryItems = urlParams.map {
                URLQueryItem(name: $0, value: $1)
            }
        }
        
        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        
        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }
        
        if addAuthorizationToken {
            urlRequest.setValue(authToken, forHTTPHeaderField: "Authorization")
        }
        
        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        
        return urlRequest
    }
}
