//
//  CoreDataTests.swift
//  TronesTests
//
//  Created by diayan siat on 27/10/2022.
//

@testable import Trones
import XCTest
import CoreData

class CoreDataTests: XCTestCase {
  override func setUpWithError() throws {
    try super.setUpWithError()
  }

  override func tearDownWithError() throws {
    try super.tearDownWithError()
  }

  func testToManagedObject() throws {
    let previewContext = PersistenceController.preview.container.viewContext
    let fetchRequest = HouseEntity.fetchRequest()
    fetchRequest.fetchLimit = 1
   // fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \HouseEntity.name, ascending: true)]
    guard let results = try? previewContext.fetch(fetchRequest),
      let first = results.first else { return }

      XCTAssert(first.name == "House Algood", """
        House name did not match, was expecting CHARLA, got
        \(String(describing: first.name))
      """)
      XCTAssert(first.region == "The Westerlands", """
        Pet type did not match, was expecting Cat, got
        \(String(describing: first.region))
      """)
  }
}
