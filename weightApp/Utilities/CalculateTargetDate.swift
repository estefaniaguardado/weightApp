//
//  TargetDate.swift
//  weightApp
//
//  Created by Estefania Guardado on 25.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import Foundation

class CalculateTargetDate {
    
    let weightInGramsToLosePerWeek: Float = 0.453
    
    func kilosToWeeks(quantity: Float) -> Float {
        let weeks = quantity / weightInGramsToLosePerWeek
        return weeks.roundTo(places: 1)
    }
    
    func weeksToDays(quantity: Float) -> Int {
        var days = quantity * 7
        days = days.roundTo(places: 0)
        return Int(days)
    }
    
    func getTimeToReachTarget(kilos: Float) -> Int {
        let resultWeeks = kilosToWeeks(quantity: kilos)
        
        return weeksToDays(quantity: resultWeeks)
    }
    
    func getTargetDate(currentDate: Date, kilos: Float) -> Date {
        let timeToReachTarget = getTimeToReachTarget(kilos: kilos)
        let targetDate = Calendar.current.date(byAdding: .day, value: timeToReachTarget, to: currentDate)
        
        return targetDate!
    }
}
