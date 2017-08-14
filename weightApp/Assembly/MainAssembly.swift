//
//  MainAssembly.swift
//  weightApp
//
//  Created by Estefania Guardado on 10.08.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import Foundation
import HealthKit
import Typhoon

class MainAssembly: TyphoonAssembly {
    
    public dynamic func introductionVC () -> AnyObject {
        
        return TyphoonDefinition.withClass(IntroductionViewController.self, configuration: {
            (definition) in
            
            definition?.injectProperty(Selector(("healthKit")), with: self.healthKitService())
            
            definition?.scope = TyphoonScope.singleton
        }) as AnyObject
    }
    
    public dynamic func healthKitService () -> AnyObject {
    
        return TyphoonDefinition.withClass(HealthKitService.self, configuration: {
            (definition) in
            
            definition?.injectProperty(Selector(("healthKitStore")), with: self.healthStore())
            
            definition?.scope = TyphoonScope.lazySingleton
        }) as AnyObject
    }
    
    public dynamic func healthStore () -> AnyObject {

        return TyphoonDefinition.withClass(HKHealthStore.self, configuration: {
            (definition) in
            
            if HKHealthStore.isHealthDataAvailable() {
                definition?.useInitializer(#selector(HKHealthStore.init))
                definition?.scope = TyphoonScope.lazySingleton
            }

        }) as AnyObject
    }
    
    public dynamic func idealWeightByLoretzUtility () -> AnyObject {
        
        return TyphoonDefinition.withClass(IdealWeightByLoretz.self, configuration: {
            (definition) in
            
            definition?.scope = TyphoonScope.lazySingleton
            
        }) as AnyObject
    }
    
    public dynamic func datesHandlerUtility () -> AnyObject {
        
        return TyphoonDefinition.withClass(DatesHandler.self, configuration: {
            (definition) in
            
            definition?.scope = TyphoonScope.lazySingleton
            
        }) as AnyObject
    }
    
    public dynamic func calculateTargetsUtility () -> AnyObject {
        
        return TyphoonDefinition.withClass(CalculateTargets.self, configuration: {
            (definition) in
            
            definition?.injectProperty(Selector(("idealWeightByLoretz")), with: self.idealWeightByLoretzUtility())
            definition?.injectProperty(Selector(("dateHandler")), with: self.datesHandlerUtility())
            definition?.scope = TyphoonScope.lazySingleton
            
        }) as AnyObject
    }
    
}
