//
//  convertorMeasures.swift
//  weightApp
//
//  Created by Estefania Guardado on 12.07.17.
//  Copyright © 2017 Estefania Guardado. All rights reserved.
//

import XCTest
@testable import weightApp

class convertorMeasuresTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOneFeetIsEqualToThirtyPointFourtyEightCentimeters() {
        let convertor = ConvertorMeasure()
        let result = convertor.feetToCentimeters(quantity: 1.0)
        XCTAssertEqual(result, 30.48)
    }
    
    func testFourFeetIsEqualToOneHundredTwentyOnePointNinetyTwoCentimeters() {
        let convertor = ConvertorMeasure()
        let result = convertor.feetToCentimeters(quantity: 4.0)
        XCTAssertEqual(result, 121.92)
    }
    
}
