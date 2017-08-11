//
//  ConvertorMeasures.swift
//  weightApp
//
//  Created by Estefania Guardado on 12.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import Foundation

class ConvertorMeasure{

    func feetToCentimeters(quantity: Float) -> Int {
        let centimeters = quantity * 30.48
        return Int(centimeters.rounded())
    }
    
    func poundsToGrams(quantity: Float) -> Int {
        let kilos = quantity * 0.453592
        return kilosToGrams(quantity: kilos)
    }
    
    func metersToCentimeters(quantity: Float) -> Int {
        let centimeters = quantity * 100.0
        return Int(centimeters.rounded())
    }
    
    func centimetersToMeters(quantity: Float) -> Int {
        let meters = Float(quantity) / 100.0
        return Int(meters.rounded())
    }
    
    func kilosToGrams(quantity: Float) -> Int {
        let grams = quantity * 1000.0
        return Int(grams.rounded())
    }
    
    func gramsToKilos(quantity: Float) -> Int {
        return Int((quantity / 1000.0).rounded())
    }
}
