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
    
    var weight: Float = 0.0
    var height: Float = 0.0
    var gender: Gender
    
    
    init (weightUser:Float, heightUser: Float, genderUser: Gender) {
        weight = weightUser
        height = heightUser
        gender = genderUser
    }
    
    func getIdealWeightByLoretz() -> Float {
        let idealWeightLoretz = IdealWeightByLoretz.init(user: gender, userHeight: height)
        return idealWeightLoretz.calculateIdealWeight()
    }
    
}
