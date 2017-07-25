//
//  TargetDate.swift
//  weightApp
//
//  Created by Estefania Guardado on 25.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import Foundation

class CalculateTargetDate {
    
    func kilosToWeeks(quantity: Float) -> Float {
        let weeks = quantity / 0.453
        return weeks.roundTo(places: 1)
    }
    
}
