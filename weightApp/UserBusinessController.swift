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
    var englishUnitsHeight = false
    var englishUnitsWeight = false

    var weight: Float = 0.0
    var height: Float = 0.0
    var gender: Gender
    
    init (nameUser: String, genderUser: String,
          weightUser:Float, unitWeight: String,
          heightUser: Float,unitHeight:String) {
        
        if unitHeight == "feet" {
            englishUnitsHeight = true
            height = convertorMeasure.feetToCentimeters(quantity: heightUser, decimals: 2)
        } else {
            height = heightUser
        }
        
        if unitWeight == "pound" {
            englishUnitsWeight = true
            weight = convertorMeasure.poundsToKilograms(quantity: weightUser, decimals: 2)
        } else {
            weight = weightUser
        }
        
        gender = genderUser == "male" ? Gender.male : Gender.female
        
    }
    
    func getIdealWeightByLoretz() -> Float {
        let idealWeightLoretz = IdealWeightByLoretz.init(user: gender, userHeight: height)
        return idealWeightLoretz.calculateIdealWeight()
    }
    
}
