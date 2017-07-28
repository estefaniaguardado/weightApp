//
//  UserBusinessController.swift
//  weightApp
//
//  Created by Estefania Guardado on 21.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import Foundation

protocol IUserDelegate {
    func getIdealWeightByLoretz() -> Float
}

class UserBusinessController: IUserDelegate {
    
    let convertorMeasure = ConvertorMeasure()
    let targetDate = CalculateTargetDate()
    var englishUnitsHeight = false
    var englishUnitsWeight = false

    var weight: Float = 0.0
    var unitsWeight: String = ""
    var height: Float = 0.0
    var gender: Gender
    
    // TODO : Data Persistence #24
    init (nameUser: String, genderUser: String,
          weightUser:Float, unitWeight: String,
          heightUser: Float,unitHeight:String) {
        
        if unitHeight == "feet" {
            englishUnitsHeight = true
            height = convertorMeasure.feetToCentimeters(quantity: heightUser, decimals: 2)
        } else {
            height = heightUser
        }
        
        unitsWeight = unitWeight
        weight = weightUser
        gender = genderUser == "male" ? Gender.male : Gender.female
        
    }
    
    func getIdealWeightByLoretz() -> Float {
        let idealWeightLoretz = IdealWeightByLoretz.init(user: gender, userHeight: height)
        var result = idealWeightLoretz.calculateIdealWeight()
        
        if unitsWeight == "pound" {
            result = convertorMeasure.poundsToKilograms(quantity: result, decimals: 2)
        }
        
        return result
    }
    
    func getTargetDate (idealWeight: Float) -> Date {
        let kilosToLose = weight - idealWeight
        
        return targetDate.getTargetDate(currentDate: Date(), kilos: kilosToLose)
    }
    
}
