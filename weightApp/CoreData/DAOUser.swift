//
//  DAOUser.swift
//  weightApp
//
//  Created by Estefania Guardado on 08.08.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import UIKit
import CoreData

class DAOUser {
    
    var managedObjectContext: NSManagedObjectContext
    
    init(completionClosure: @escaping () -> ()) {
        
        guard let modelURL = Bundle.main.url(forResource: "weightApp", withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }

        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        
        managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = psc
        
        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
        queue.async {
            
            guard let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
                fatalError("Unable to resolve document directory")
            }
            
            let storeURL = docURL.appendingPathComponent("weightApp.sqlite")
            
            do {
                try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
                DispatchQueue.main.sync(execute: completionClosure)
                
            } catch {
                fatalError("Error migrating store: \(error)")
            }
        }
        
    }
    
                                     "currentWeight": data.userWeight,
                                     "height": data.userHeight])
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could dont save: \(error), \(error.userInfo)")
        }
    }
    
}
