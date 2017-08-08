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
    
    func saveUserData(data: User) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "UserData", in: managedContext)!
        
        let repository = NSManagedObject.init(entity: entity, insertInto: managedContext)
        
        repository.setValuesForKeys(["biologicalSex": data.userBiologicalSex,
                                     "currentWeight": data.userWeight,
                                     "height": data.userHeight])
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could dont save: \(error), \(error.userInfo)")
        }
    }
    
}
