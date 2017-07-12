//
//  ConvertorMeasures.swift
//  weightApp
//
//  Created by Estefania Guardado on 12.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import Foundation

class ConvertorMeasure{

    func feetToCentimeters(quantity: Float) -> Float {
        let feets = quantity * 30.48
        return feets
    }
}
