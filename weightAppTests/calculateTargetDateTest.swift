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
    
    let calculationTarget = CalculateTargetDate()
    let dateHandler = DatesHandler()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test30KilosIsEqualTo62Point2Weeks() {
        let result = calculationTarget.kilosToWeeks(quantity: 30)
        XCTAssertEqual(result, 66.2)
    }
    
    func test5KilosIsEqualTo11Weeks() {
        let result = calculationTarget.kilosToWeeks(quantity: 5)
        XCTAssertEqual(result, 11.0)
    }
    
    func test10Point5IsEqualTo22Point2Weeks() {
        let result = calculationTarget.kilosToWeeks(quantity: 10.5)
        XCTAssertEqual(result, 23.2)
    }
    
    func test62Point5WeeksIsEqualTo438Days() {
        let result = calculationTarget.weeksToDays(quantity: 62.5)
        XCTAssertEqual(result, 438)
    }
    
    func test10Point5WeeksIsEqualTo74Days() {
        let result = calculationTarget.weeksToDays(quantity: 10.5)
        XCTAssertEqual(result, 74)
    }
    
    func testLose5KilosFrom26July2017Is11October2017TargetDate() {
        let initDate = dateHandler.createDateFrom(year: 2017, month: 07, day: 26)
        let targetDate = dateHandler.createDateFrom(year: 2017, month: 10, day: 11)

        let result = calculationTarget.getTargetDate(currentDate: initDate, kilos: 5.0)
        XCTAssertEqual(result, targetDate)
    }
    
    func testLose30KilosFrom26July2017Is1November2018TargetDate() {
        let initDate = dateHandler.createDateFrom(year: 2017, month: 07, day: 26)
        let targetDate = dateHandler.createDateFrom(year: 2018, month: 11, day: 1)
        
        let result = calculationTarget.getTargetDate(currentDate: initDate, kilos: 30.0)
        XCTAssertEqual(result, targetDate)
    }
    
}
