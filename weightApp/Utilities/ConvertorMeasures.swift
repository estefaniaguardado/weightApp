//
//  ConvertorMeasures.swift
//  weightApp
//
//  Created by Estefania Guardado on 12.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import Foundation

extension Float {
    func roundTo(places:Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}

class ConvertorMeasure{

    
    func feetToCentimeters(quantity: Float) -> Int {
        let meters = quantity * 30.48
        return Int(meters.rounded())
    }
    
    func centimetersToFeets(quantity: Int) -> Int {
        let feets = Float(quantity) * 0.0328084
        return Int(feets.rounded())
    }
    
    func poundsToGrams(quantity: Float) -> Int {
        let kilos = quantity * 0.453592
        return kilosToGrams(quantity: kilos)
    }
    
    func kilogramsToPounds(quantity: Float, decimals: Int) -> Float {
        let pounds = quantity * 2.20462
        return pounds.roundTo(places: decimals)
    }
    
    func metersToCentimeters(quantity: Float, decimals: Int) -> Float {
        let centimeters = quantity * 100.0
        return centimeters.roundTo(places: decimals)
    }
    
    func centimetersToMeters(quantity: Float, decimals: Int) -> Float {
        let meters = quantity / 100.0
        return meters.roundTo(places: decimals)
    }
    
    func kilosToGrams(quantity: Float) -> Int {
        let grams = quantity * 1000.0
        return Int(grams.rounded())
    }
    
    func gramsToKilos(quantity: Float, decimals: Int) -> Float {
        let kilos = quantity / 1000.0
        return kilos.roundTo(places: decimals)
    }
}
