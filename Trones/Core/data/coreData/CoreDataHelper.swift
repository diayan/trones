//
//  CoreDataHelper.swift
//  Trones
//
//  Created by diayan siat on 26/10/2022.
//

import Foundation
import CoreData

enum CoreDataHelper {
  static let context = PersistenceController.shared.container.viewContext
  static let previewContext = PersistenceController.preview.container.viewContext

  static func clearDatabase() {
    let entities = PersistenceController.shared.container.managedObjectModel.entities
    entities.compactMap(\.name).forEach(clearTable)
  }

  private static func clearTable(_ entity: String) {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
    do {
      try context.execute(deleteRequest)
      try context.save()
    } catch {
      fatalError("\(#file), \(#function), \(error.localizedDescription)")
    }
  }
}

extension CoreDataHelper {
    static func getHouses() -> House? {
      let fetchRequest = HouseEntity.fetchRequest()
      if let results = try? previewContext.fetch(fetchRequest),
        let first = results.first {
        return House(managedObject: first)
      }
      return nil
    }
    
    static func getTestHouseEntity() -> HouseEntity? {
      let fetchRequest = HouseEntity.fetchRequest()
      fetchRequest.fetchLimit = 1
      guard let results = try? previewContext.fetch(fetchRequest),
      let first = results.first else { return nil }
      return first
    }
    
    static func getTestHouseEntities() -> [HouseEntity]? {
      let fetchRequest = HouseEntity.fetchRequest()
      guard let results = try? previewContext.fetch(fetchRequest),
        !results.isEmpty else { return nil }
      return results
    }


}
