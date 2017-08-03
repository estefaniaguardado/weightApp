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
    
    func authorizationHealthKit (completion: ((_ success: Bool, _ error: NSError?) -> Void)!) {
        
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
        
        
        healthKitStore.requestAuthorization(toShare: nil, read: dataTypesToRead as? Set<HKObjectType>) { (success, error) -> Void in
            if success {
                completion(true, error as NSError?)
            } else {
                completion(false, error as NSError?)
            }
        }
        
    }
    
    func readProfile()
    {
        
    }
    
    func getWeight (completion: @escaping (_ weight: HKQuantitySample?, _ error: NSError?) -> Void) -> Void {
        
        guard let quantityType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass) else {
            print("Unable to create quantity type")
            return
        }
        
        let weightQuery = HKSampleQuery(sampleType: quantityType, predicate: nil, limit: 1, sortDescriptors: nil) {
            
            query, results, error in
            
            if error != nil {
                completion (nil, error as NSError?)
                return
            }
            
            if results?.count != 0 {
                let bodymass = results?[0] as? HKQuantitySample
                completion(bodymass, nil)
                return
            } else {
                completion(nil, error as NSError?)
                return
            }
        }
        
        self.healthKitStore.execute(weightQuery)
        
    }
    
}
