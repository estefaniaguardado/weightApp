//
//  ConvertorMeasures.swift
//  weightApp
//
//  Created by Estefania Guardado on 12.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import Foundation

class ConvertorMeasure: NSObject {

    func feetToCentimeters(quantity: Double) -> Int {
        let centimeters = quantity * 30.48
        return Int(centimeters.rounded())
    }
    
    func feetToInches(quantity: Double) -> Int {
        let feets = quantity * 12
        return Int(feets.rounded())
    }
    
    func inchesToCentimeters(quantity: Int) -> Int {
        let centimeters = Float(quantity) * 2.54
        return Int(centimeters.rounded())
    }
    
    func poundsToGrams(quantity: Double) -> Int {
        let kilos = quantity * 0.453592
        return kilosToGrams(quantity: kilos)
    }
    
    func metersToCentimeters(quantity: Double) -> Int {
        let centimeters = quantity * 100.0
        return Int(centimeters.rounded())
    }
    
    func centimetersToMeters(quantity: Double) -> Int {
        let meters = Float(quantity) / 100.0
        return Int(meters.rounded())
    }
    
    func kilosToGrams(quantity: Double) -> Int {
        let grams = quantity * 1000.0
        return Int(grams.rounded())
    }
    
    func gramsToKilos(quantity: Double) -> Int {
        return Int((quantity / 1000.0).rounded())
    }
}
