//
//  DatesHandler.swift
//  weightApp
//
//  Created by Estefania Guardado on 26.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import Foundation

class DatesHandler {
    
    func createDateFrom(year: Int, month: Int, day: Int) -> Date {
        let calendar = Calendar.init(identifier: .gregorian)
        var components = DateComponents()
        components.setValue(year, for: .year)
        components.setValue(month, for: .month)
        components.setValue(day, for: .day)
        
        return calendar.date(from: components)!
    }
    
}
