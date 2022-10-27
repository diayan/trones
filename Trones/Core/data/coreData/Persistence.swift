//
//  Persistence.swift
//  Trones
//
//  Created by diayan siat on 26/10/2022.
//

import CoreData

struct PersistenceController {
  static let shared = PersistenceController()
    
    ///this provide in memory storage for you to persist data in memory
    static var preview: PersistenceController = {
      let result = PersistenceController(inMemory: true)
      let viewContext = result.container.viewContext
        for index in 0..<House.houses.count {
            var house = House.houses[index]
            house.toManagedObject(context: viewContext)
        }
        
      do {
        try viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
      return result
    }()

    let container: NSPersistentCloudKitContainer

    init(inMemory: Bool = false) {
      container = NSPersistentCloudKitContainer(name: "Trones")
      if inMemory {
        container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
      }
      container.loadPersistentStores { _, error in
        if let error = error as NSError? {
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }
      }
      container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
      container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    ///On-Disk Store
    static func save() {
        ///get context of core data using the on-disk store
        let context = PersistenceController.shared.container.viewContext
        guard context.hasChanges else { return } /// check if there are changes
        do {
            try context.save()
        }catch {
            fatalError("""
                    \(#file), \
                    \(#function), \
                    \(error.localizedDescription)
                  """)
        }
    }
}


