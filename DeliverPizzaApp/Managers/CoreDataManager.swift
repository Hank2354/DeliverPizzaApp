//
//  CoreDataManager.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 12.01.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    func entityForName(entityName: String) -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: entityName, in: self.managedObjectContext)!
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer:  NSPersistentContainer  = {

        let container = NSPersistentContainer(name: "MoneySafe")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        // New data adding in save data (if conflict)
        container.viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
        container.viewContext.shouldDeleteInaccessibleFaults = true
        
        // automatically merge data
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        return container
    }()
    
    /// main thread context
    lazy var managedObjectContext:           NSManagedObjectContext = persistentContainer.viewContext
    
    /// background context
    lazy var managetObjectBackgroundContext: NSManagedObjectContext = persistentContainer.newBackgroundContext()

    // MARK: - Core Data Saving support
    func saveContext () {
        
        if managedObjectContext.hasChanges {
            
            do {
                try managedObjectContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
            
        }
        
    }
    
    func saveBackgroundContext () {
        
        managetObjectBackgroundContext.performAndWait {
            
            if managetObjectBackgroundContext.hasChanges {
                
                do {
                    try managetObjectBackgroundContext.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
                
            }
            
        }
        
    }
    
}
