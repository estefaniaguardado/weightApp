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
    
    let convertor = ConvertorMeasure()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOneFeetIsEqualToThirtyPointFourtyEightCentimeters() {
        let result = convertor.feetToCentimeters(quantity: 1.0)
        XCTAssertEqual(result, 30.48)
    }
    
    func testFourFeetIsEqualToOneHundredTwentyOnePointNinetyTwoCentimeters() {
        let result = convertor.feetToCentimeters(quantity: 4.0)
        XCTAssertEqual(result, 121.92)
    }
    
    func testSixPointFiveFeetIsEqualToThirtyPointFourtyEightCentimeters() {
        let result = convertor.feetToCentimeters(quantity: 6.5)
        XCTAssertEqual(result, 198.12)
    }
    
    func testOneCentimeterIsEqualToPointZeroThreeHundredTwentyEightThousandFeets() {
        let result = convertor.centimetersToFeets(quantity: 1.0)
        XCTAssertEqual(result, 0.0328)
    }
    
    func test172CentimeterIsEqualToPointZeroThreeHundredTwentyEightThousandFeets() {
        let result = convertor.centimetersToFeets(quantity: 172.0)
        XCTAssertEqual(result, 5.6430)
    }
    
    func testOnePoundIsEqualToPointFourThousandFiveHundredThirtyFiveKilograms() {
        let result = convertor.poundsToKilograms(quantity: 1.0)
        XCTAssertEqual(result, 0.4536)
    }
    
    func test4Point56PoundsIsEqualTo2Point0684Kilograms() {
        let result = convertor.poundsToKilograms(quantity: 4.56)
        XCTAssertEqual(result, 2.0684)
    }
    
    func test100Point69PoundsIsNotEqualTo45Point6721Kilograms() {
        let result = convertor.poundsToKilograms(quantity:100.69)
        XCTAssertNotEqual(result, 45.6721)
    }
}
