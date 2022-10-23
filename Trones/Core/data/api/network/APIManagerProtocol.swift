//
//  APIManagerProtocol.swift
//  Trones
//
//  Created by diayan siat on 22/10/2022.
//

import Foundation

///This protocol is required to implement perform perform(_:authToken:). It takes an object that conforms to RequestProtocol,
///and authtoken and returns data, otherwise it throws an error
protocol APIManagerProtocol {
    func perform(_ request: RequestProtocol, authToken: String) async throws -> Data
}

///This class will be uses to manage all network requests
class APIManager: APIManagerProtocol {
    private let urlSession: URLSession
    
    ///default URLSession.shared provides a singleton that returns a URLSession
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func perform(_ request: RequestProtocol, authToken: String = "") async throws -> Data {
        
        let (data, response) = try await urlSession.data(for: request.createUrlRequest(authToken: authToken))
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            throw NetworkError.invalidServerResponse
        }
        return data
    }
}
