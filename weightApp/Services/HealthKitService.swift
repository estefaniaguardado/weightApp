//
//  HealthKitService.swift
//  weightApp
//
//  Created by Estefania Guardado on 29.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import Foundation
import HealthKit

class HealthKitService {

    var healthKitStore:HKHealthStore! = nil
    
    func authorizationHealthKit () {
        
        healthKitStore = {
            if HKHealthStore.isHealthDataAvailable() {
                return HKHealthStore()
            } else {
                return nil
            }
        }()
        
        let HK_biologicalSex = HKCharacteristicType.characteristicType(forIdentifier: .biologicalSex)
        let HK_bodyMass = HKQuantityType.quantityType(forIdentifier: .bodyMass)
        let HK_height = HKQuantityType.quantityType(forIdentifier: .height)
        
        let dataTypesToRead = NSSet(objects: HK_biologicalSex ?? "",
                                    HK_bodyMass ?? "", HK_height ?? "")
        
        
        healthKitStore.requestAuthorization(toShare: nil, read: dataTypesToRead as? Set<HKObjectType>) { (success, error) in
            if !success {
            print(error!)
            }
        }
        
    }
    
    
}
