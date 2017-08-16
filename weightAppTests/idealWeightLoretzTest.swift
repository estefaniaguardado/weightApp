//
//  idealWeightLoretzTest.swift
//  weightApp
//
//  Created by Estefania Guardado on 07.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import XCTest
@testable import weightApp

class idealWeightLoretzTest: XCTestCase {
    
    private let data = IdealWeightByLoretz()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIdealWeightToWomen172cm() {
        let result = data.calculateIdealWeight(userGender: "female", userHeight: 172)
        XCTAssertEqual(result, 61)
    }
    
    func testIdealWeightToMale180cm() {
        let result = data.calculateIdealWeight(userGender: "male", userHeight: 180)
        XCTAssertEqual(result, 73)
    }
}
