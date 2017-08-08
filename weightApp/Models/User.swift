//
//  User.swift
//  weightApp
//
//  Created by Estefania Guardado on 07.08.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import Foundation

struct User {
    var userBiologicalSex: String!
    var userWeight: Double!
    var userHeight: Double!
    
    init() {
        userBiologicalSex = "notSet"
        userWeight = 0.0
        userHeight = 0.0
    }
    
    init(biologicalSex: String?, weight: Double?, height: Double?) {
        userBiologicalSex = biologicalSex != nil ? biologicalSex : "notSet"
        userWeight = weight != nil ? weight : 0.0
        userHeight = height != nil ? height : 0.0
    }
    
}
