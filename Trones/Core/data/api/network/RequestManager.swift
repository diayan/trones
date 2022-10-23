//
//  RequestManager.swift
//  Trones
//
//  Created by diayan siat on 22/10/2022.
//

import Foundation

protocol RequestManagerProtocol {
    ///takes a RequestProtocol and returns an object that conforms to Decodable (the object has to be explicitly mentioned) or an Error.
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

class RequestManager: RequestManagerProtocol {
    let apiManager: APIManagerProtocol
    let parser: DataParserProtocol
    
    init(apiManager: APIManagerProtocol = APIManager(), parser: DataParserProtocol = DataParser()) {
        self.apiManager = apiManager
        self.parser = parser
    }
    
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
        let data = try await apiManager.perform(request, authToken: "")
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
}

