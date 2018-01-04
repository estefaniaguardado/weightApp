//
//  CalculateTargets.swift
//  weightApp
//
//  Created by Estefania Guardado on 11.08.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import Foundation

class CalculateTargets: NSObject {
    
    @objc var dateHandler: DatesHandler!
    @objc var idealWeightByLoretz: IdealWeightByLoretz!
    let weightInGramsToLosePerWeek: Float = 0.453
    
    func kilosToWeeks(quantity: Int) -> Int {
        let weeks = Float(quantity) / weightInGramsToLosePerWeek
        return Int(weeks.rounded())
    }
    
    func weeksToDays(quantity: Int) -> Int {
        return quantity * 7
    }
    
    func getTargetDate(currentDate: Date, kilos: Int) -> Date {
        let resultWeeks = kilosToWeeks(quantity: kilos)
        let totalDays = weeksToDays(quantity: resultWeeks)
        let targetDate = dateHandler.addDaysToDate(date: currentDate, days: totalDays)
        
        return targetDate
    }
    
    func getTargetWeight(gender: String, height: Int) -> Int {
        return idealWeightByLoretz.calculateIdealWeight(userGender: gender, userHeight: height)
    }
}
