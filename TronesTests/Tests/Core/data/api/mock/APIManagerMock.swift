//
//  ApiManagerMock.swift
//  TronesTests
//
//  Created by diayan siat on 26/10/2022.
//

import SwiftUI
@testable import Trones

struct APIManagerMock: APIManagerProtocol {

    func perform(_ request: RequestProtocol, authToken: String) async throws -> Data {
    return try Data(contentsOf: URL(fileURLWithPath: request.path), options: .mappedIfSafe)
  }
}
