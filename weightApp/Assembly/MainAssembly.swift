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
            
            definition?.injectProperty(Selector!.init("healthKit"), with: self.healthKitService())
            
            definition?.scope = TyphoonScope.singleton
        }) as AnyObject
    }
    
    public dynamic func healthKitService () -> AnyObject {
    
        return TyphoonDefinition.withClass(HealthKitService.self, configuration: {
            (definition) in
            
            definition?.injectProperty(Selector!.init("healthKitStore"), with: self.healthStore())
            
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
    
}
