//
//  IdealWeightByLoretz.swift
//  weightApp
//
//  Created by Estefania Guardado on 07.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import Foundation

class IdealWeightByLoretz{
    
    func calculateIdealWeight(userGender: String, userHeight: Int) -> Int {
        
        if userGender == "female" {
            let formulaLoretzToFemale = (userHeight - 100) - ((userHeight - 150) / 2)
            return formulaLoretzToFemale
        }
        
        if userGender == "male" {
            let formulaLoretzToMale = (userHeight - 100) - ((userHeight - 150) / 4)
            return formulaLoretzToMale
        }
        
        return 0
    }
}
