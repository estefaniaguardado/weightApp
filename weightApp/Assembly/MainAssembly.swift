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
            
            definition?.useInitializer(Selector("isHealthDataAvailable"))
            
            definition?.scope = TyphoonScope.lazySingleton
        }) as AnyObject
    }
    
}
