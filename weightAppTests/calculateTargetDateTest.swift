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
        XCTAssertEqual(result, 22.0)
    }
}
