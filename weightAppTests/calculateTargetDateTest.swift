//
//  targetDateTest.swift
//  weightApp
//
//  Created by Estefania Guardado on 25.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import XCTest
@testable import weightApp

class targetDateTest: XCTestCase {
    
    private var calculationTarget = CalculateTargets()
    private var dateHandler = DatesHandler()
    
    override func setUp() {
        super.setUp()
        calculationTarget.dateHandler = dateHandler
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test30KilosIsEqualTo62Point2Weeks() {
        let result = calculationTarget.kilosToWeeks(quantity: 30)
        XCTAssertEqual(result, 66) //66.2
    }
    
    func test5KilosIsEqualTo11Weeks() {
        let result = calculationTarget.kilosToWeeks(quantity: 5)
        XCTAssertEqual(result, 11)
    }
    
    func test10Point5IsEqualTo22Point2Weeks() {
        let result = calculationTarget.kilosToWeeks(quantity: 10)
        XCTAssertEqual(result, 22) //22.07
    }
    
    func test62Point5WeeksIsEqualTo438Days() {
        let result = calculationTarget.weeksToDays(quantity: 62)
        XCTAssertEqual(result, 434)
    }
    
    func test10Point5WeeksIsEqualTo74Days() {
        let result = calculationTarget.weeksToDays(quantity: 10)
        XCTAssertEqual(result, 70)
    }
    
    func testLose5KilosFrom26July2017Is11October2017TargetDate() {
        let initDate = dateHandler.createDateFrom(year: 2017, month: 07, day: 26)
        let targetDate = dateHandler.createDateFrom(year: 2017, month: 10, day: 11)

        let result = calculationTarget.getTargetDate(currentDate: initDate, kilos: 5)
        XCTAssertEqual(result, targetDate)
    }
    
    func testLose30KilosFrom26July2017Is1November2018TargetDate() {
        let initDate = dateHandler.createDateFrom(year: 2017, month: 07, day: 26)
        let targetDate = dateHandler.createDateFrom(year: 2018, month: 10, day: 31)
        
        let result = calculationTarget.getTargetDate(currentDate: initDate, kilos: 30)
        XCTAssertEqual(result, targetDate)
    }
    
}
