//
//  House+CoreData.swift
//  Trones
//
//  Created by diayan siat on 26/10/2022.
//

import CoreData

extension House {
    init(managedObject: HouseEntity) {
        self.name = managedObject.name
        self.region = managedObject.region
        self.coatOfArms = managedObject.coatOfArms
        self.words = managedObject.words
        self.url = managedObject.url
        self.currentLord = managedObject.currentLord
        self.heir = managedObject.heir
        self.overlord = managedObject.overlord
        self.founded = managedObject.founded
        self.founder = managedObject.founder
        self.diedOut = managedObject.diedOut
        ///arrays
        self.titles = []
        self.seats = []
        self.ancestralWeapons = []
        self.cadetBranches = []
        self.swornMembers = []
    }
    
    private func checkForExistingHouse(id: Int, context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) -> Bool {
            let fetchRequest = HouseEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id = %d", id)
            if let result = try? context.fetch(fetchRequest), result.first != nil {
                return true
            }
            return false
        }
}

extension House {
    ///convert the struct objects to Core Data managed objects using mirroring api 
    mutating func toManagedObject(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        guard let id = self.id else { return }
        guard checkForExistingHouse(id: id, context: context) == false else { return }
        let persistenceValue = HouseEntity.init(context: context)
        persistenceValue.id = Int64(id)
        persistenceValue.name = self.name
        persistenceValue.region = self.region
        persistenceValue.coatOfArms = self.coatOfArms
        persistenceValue.words = self.words
        persistenceValue.url = self.url
        persistenceValue.currentLord = self.currentLord
        persistenceValue.heir = self.heir
        persistenceValue.overlord = self.overlord
        persistenceValue.founded = self.founded
        persistenceValue.founder = self.founder
        persistenceValue.diedOut = self.diedOut
    }
}
