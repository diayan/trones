//
//  DataParserProtocol.swift
//  Trones
//
//  Created by diayan siat on 22/10/2022.
//

import Foundation


protocol DataParserProtocol {
    func parse<T: Decodable>(data: Data) throws -> T
}

///DataParser conforms to a protocol DataParserProtocol that implements a method parse which takes in Data
///and returns a generic Decodable. Then it uses JSONDecoder to decode Data into a Decodable.
class DataParser: DataParserProtocol {
    private var jsonDecoder: JSONDecoder
    
    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
        self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func parse<T>(data: Data) throws -> T where T : Decodable {
        return try jsonDecoder.decode(T.self, from: data)
    }
}

