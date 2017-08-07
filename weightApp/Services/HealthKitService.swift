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
    private var HK_resultHeight: Double?
    private var HK_resultWeight: Double?
    private var HK_resultBiologicalSex: String?
    
    init() {
        healthKitStore = HKHealthStore.isHealthDataAvailable() ? HKHealthStore() : nil;
    }
    
    func accessHealthKit() -> Promise<User>? {
        if healthKitStore == nil { return nil }
        
        return authorizationHealthKit()
            .then { success in self.getBiologicalSex() }
            .then { biologicaSex in self.getWeight() }
            .then { weight in self.getHeight() }
            .then { height in self.getUserData() }
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
                        HK_resultBiologicalSex = "female"
                        return fulfill(HK_resultBiologicalSex)
                    case .male:
                        HK_resultBiologicalSex = "male"
                        return fulfill(HK_resultBiologicalSex)
                    case .notSet:
                        HK_resultBiologicalSex = nil
                        return fulfill(HK_resultBiologicalSex)
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
                self.HK_resultWeight = bodymass?.quantity.doubleValue(for: HKUnit.gram())
                fulfill(self.HK_resultWeight)
                
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
                self.HK_resultHeight = heightResult?.quantity.doubleValue(for: HKUnit.meter())
                fulfill(self.HK_resultHeight)
                
            }
            
            self.healthKitStore?.execute(heightQuery)
        }
    }
    
    private func getUserData() -> Promise<User> {
        
        return Promise<User>{ fulfill, reject in
            fulfill(User.init(biologicalSex: HK_resultBiologicalSex,
                              weight: HK_resultWeight,
                              height: HK_resultHeight))
        }
    }
    
}
