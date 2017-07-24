//
//  IdealWeightByLoretz.swift
//  weightApp
//
//  Created by Estefania Guardado on 07.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import Foundation

enum Gender {
    case male, female
}

class IdealWeightByLoretz{

    var gender: Gender
    var height: Float
    
    let convertor = ConvertorMeasure()

    init(user: Gender, userHeight: Float) {
        gender = user
        height = convertor.metersToCentimeters(quantity: userHeight, decimals: 2)
    }
    
    func calculateIdealWeight() -> Float {
        
        if gender == Gender.female {
            let formulaLoretzToFemale = (height - 100.0) - ((height - 150) / 2)
            return formulaLoretzToFemale
        }
        
        if gender == Gender.male {
            let formulaLoretzToMale = (height - 100.0) - ((height - 150) / 4)
            return formulaLoretzToMale
        }
        
        return 0
    }
}
