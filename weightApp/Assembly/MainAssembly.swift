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
    
    @objc public dynamic func introductionVC () -> AnyObject {
        
        return TyphoonDefinition.withClass(IntroductionViewController.self, configuration: {
            (definition) in
            
            definition?.injectProperty(Selector(("healthKit")), with: self.healthKitService())
            
            definition?.scope = TyphoonScope.singleton
        }) as AnyObject
    }
    
    @objc public dynamic func healthKitService () -> AnyObject {
    
        return TyphoonDefinition.withClass(HealthKitService.self, configuration: {
            (definition) in
            
            definition?.injectProperty(Selector(("healthKitStore")), with: self.healthStore())
            
            definition?.scope = TyphoonScope.lazySingleton
        }) as AnyObject
    }
    
    @objc public dynamic func healthStore () -> AnyObject {

        return TyphoonDefinition.withClass(HKHealthStore.self, configuration: {
            (definition) in
            
            if HKHealthStore.isHealthDataAvailable() {
                definition?.useInitializer(#selector(HKHealthStore.init))
                definition?.scope = TyphoonScope.lazySingleton
            }

        }) as AnyObject
    }
    
    @objc public dynamic func idealWeightByLoretzUtility () -> AnyObject {
        
        return TyphoonDefinition.withClass(IdealWeightByLoretz.self, configuration: {
            (definition) in
            
            definition?.scope = TyphoonScope.lazySingleton
            
        }) as AnyObject
    }
    
    @objc public dynamic func datesHandlerUtility () -> AnyObject {
        
        return TyphoonDefinition.withClass(DatesHandler.self, configuration: {
            (definition) in
            
            definition?.scope = TyphoonScope.lazySingleton
            
        }) as AnyObject
    }
    
    @objc public dynamic func calculateTargetsUtility () -> AnyObject {
        
        return TyphoonDefinition.withClass(CalculateTargets.self, configuration: {
            (definition) in
            
            definition?.injectProperty(Selector(("idealWeightByLoretz")), with: self.idealWeightByLoretzUtility())
            definition?.injectProperty(Selector(("dateHandler")), with: self.datesHandlerUtility())
            definition?.scope = TyphoonScope.lazySingleton
            
        }) as AnyObject
    }
    
    @objc public dynamic func convertorMeasureUtility () -> AnyObject {
        
        return TyphoonDefinition.withClass(ConvertorMeasure.self, configuration: {
            (definition) in
            
            definition?.scope = TyphoonScope.lazySingleton
            
        }) as AnyObject
    }
    
    @objc public dynamic func initStatusVC () -> AnyObject {
    
        return TyphoonDefinition.withClass(InitStatusViewController.self, configuration: {
            (definition) in
            
            definition?.injectProperty(Selector(("calculateTargets")), with: self.calculateTargetsUtility())
            definition?.injectProperty(Selector(("convertorMeasure")), with: self.convertorMeasureUtility())
            definition?.scope = TyphoonScope.lazySingleton
            
        }) as AnyObject
    }
    
    @objc public dynamic func initTargetVC () -> AnyObject {
        
        return TyphoonDefinition.withClass(InitTargetViewController.self, configuration: {
            (definition) in
            
            definition?.injectProperty(Selector(("calculateTargets")), with: self.calculateTargetsUtility())
            definition?.scope = TyphoonScope.lazySingleton
            
        }) as AnyObject
    }
    
}
