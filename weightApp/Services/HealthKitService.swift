//
//  HealthKitService.swift
//  weightApp
//
//  Created by Estefania Guardado on 29.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import Foundation
import HealthKit
import PromiseKit

class HealthKitService {
    private var healthKitStore:HKHealthStore?
    
    init() {
        healthKitStore = HKHealthStore.isHealthDataAvailable() ? HKHealthStore() : nil;
    }
    
    func accessHealthKit() -> Promise<User>? {
        if healthKitStore == nil { return nil }
        var user = User()
        
        return authorizationHealthKit()
            .then { success -> Promise<String?> in
                return self.getBiologicalSex() }
            .then { biologicalSex -> Promise<Double?> in
                user.userBiologicalSex = biologicalSex
                return self.getWeight() }
            .then { weight -> Promise<Double?> in
                user.userWeight = weight
                return self.getHeight() }
            .then { height -> User in
                user.userHeight = height
                return user }
    }
    
    private func authorizationHealthKit() -> Promise<Bool> {
        
        return Promise<Bool> { fulfill, reject in

            let HK_biologicalSex = HKCharacteristicType.characteristicType(forIdentifier: .biologicalSex)
            let HK_bodyMass = HKQuantityType.quantityType(forIdentifier: .bodyMass)
            let HK_height = HKQuantityType.quantityType(forIdentifier: .height)
            
            let dataTypesToRead = NSSet(objects: HK_biologicalSex ?? "",
                                        HK_bodyMass ?? "", HK_height ?? "")
            
            healthKitStore?.requestAuthorization(toShare: nil, read: dataTypesToRead as? Set<HKObjectType>) { (success, error) -> Void in
                
                guard error == nil else {
                    reject(error!)
                    return
                }
                
                fulfill(success)
            }
        }
        
    }
    
    private func getBiologicalSex() -> Promise<String?> {
        
        return Promise<String?> { fulfill, reject in
            
            do{
                if let biologicalSex = try healthKitStore?.biologicalSex() {
                    switch biologicalSex.biologicalSex {
                    case .female:
                        return fulfill("female")
                    case .male:
                        return fulfill("male")
                    default:
                        return fulfill(nil)
                    }
                }
            } catch {
                reject(error)
                return
            }
        }
    }
    
    private func getWeight() -> Promise<Double?> {

        return Promise<Double?> { fulfill, reject in
            let quantityType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)
            
            let weightQuery = HKSampleQuery(sampleType: quantityType!, predicate: nil, limit: 1, sortDescriptors: nil) {
                query, results, error in
                
                guard error == nil else {
                    reject(error!)
                    return
                }
                
                let bodymass = (results?.count)! > 0 ? results?[0] as? HKQuantitySample : nil
                fulfill(bodymass?.quantity.doubleValue(for: HKUnit.gram()))
                
            }
            
            self.healthKitStore?.execute(weightQuery)
        }
    }
    
    private func getHeight() -> Promise<Double?> {
        
        return Promise<Double?> { fulfill, reject in
            let quantityType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height)
            
            let heightQuery = HKSampleQuery(sampleType: quantityType!, predicate: nil, limit: 1, sortDescriptors: nil) {
                query, results, error in
                
                guard error == nil else {
                    reject(error!)
                    return
                }
                
                let heightResult = (results?.count)! > 0 ? results?[0] as? HKQuantitySample : nil
                fulfill(heightResult?.quantity.doubleValue(for: HKUnit.meter()))
                
            }
            
            self.healthKitStore?.execute(heightQuery)
        }
    }
    
}
