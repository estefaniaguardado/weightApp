//
//  User.swift
//  weightApp
//
//  Created by Estefania Guardado on 07.08.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import Foundation

struct User {
    var userBiologicalSex: String?
    var userWeight: Double?
    var userHeight: Double?
    
    init(biologicalSex: String?, weight: Double?, height: Double?) {
        userBiologicalSex = biologicalSex
        userWeight = weight
        userHeight = height
    }
    
}
