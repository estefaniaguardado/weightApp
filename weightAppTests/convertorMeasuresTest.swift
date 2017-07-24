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
    
    func testOneFeetIsEqualTo30Point48Centimeters() {
        let result = convertor.feetToCentimeters(quantity: 1.0, decimals: 2)
        XCTAssertEqual(result, 30.48)
    }
    
    func testFourFeetIsEqualTo121Point92Centimeters() {
        let result = convertor.feetToCentimeters(quantity: 4.0, decimals: 2)
        XCTAssertEqual(result, 121.92)
    }
    
    func test6Point5FeetIsEqualTo198Point12Centimeters() {
        let result = convertor.feetToCentimeters(quantity: 6.5, decimals: 2)
        XCTAssertEqual(result, 198.12)
    }
    
    func test156Point97CentimeterIsNotEqualTo5Point14Feets() {
        let result = convertor.centimetersToFeets(quantity: 156.97, decimals: 2)
        XCTAssertNotEqual(result, 5.14)
    }
    
    func testOneCentimeterIsEqualToPoint0328Feets() {
        let result = convertor.centimetersToFeets(quantity: 1.0, decimals: 4)
        XCTAssertEqual(result, 0.0328)
    }
    
    func test172CentimeterIsEqualTo5Point6430Feets() {
        let result = convertor.centimetersToFeets(quantity: 172.0, decimals: 4)
        XCTAssertEqual(result, 5.6430)
    }
    
    func testOnePoundIsEqualToPoint4536Kilograms() {
        let result = convertor.poundsToKilograms(quantity: 1.0, decimals: 4)
        XCTAssertEqual(result, 0.4536)
    }
    
    func test4Point56PoundsIsEqualTo2Point0684Kilograms() {
        let result = convertor.poundsToKilograms(quantity: 4.56, decimals: 4)
        XCTAssertEqual(result, 2.0684)
    }
    
    func test100Point69PoundsIsNotEqualTo45Point6721Kilograms() {
        let result = convertor.poundsToKilograms(quantity:100.69, decimals: 4)
        XCTAssertNotEqual(result, 45.6721)
    }
    
    func test98Point52PoundIsNotEqualTo44Point68Kilograms() {
        let result = convertor.poundsToKilograms(quantity: 98.52, decimals: 2)
        XCTAssertNotEqual(result, 44.68)
    }
    
    func testOneKilogramIsEqualTo2Point2046Pounds() {
        let result = convertor.kilogramsToPounds(quantity: 1.0, decimals: 4)
        XCTAssertEqual(result, 2.2046)
    }
    
    func test100Point59KilogramsIsEqualTo221Point7627Pounds() {
        let result = convertor.kilogramsToPounds(quantity: 100.59, decimals: 4)
        XCTAssertEqual(result, 221.7627)
    }
    
    func test78Point98KilogramsIsNotEqualTo172Point1208Pounds() {
        let result = convertor.kilogramsToPounds(quantity: 78.98, decimals: 4)
        XCTAssertNotEqual(result, 174.1208)
    }
    
    func test87Point56KilogramIsNotEqualTo192Point99Pounds() {
        let result = convertor.kilogramsToPounds(quantity: 87.56, decimals: 2)
        XCTAssertNotEqual(result, 192.99)
    }
    
    func testOneMeterIsEqualTo100Centimeters() {
        let result = convertor.metersToCentimeters(quantity: 1.0, decimals: 2)
        XCTAssertEqual(result, 100.00)
    }
}
