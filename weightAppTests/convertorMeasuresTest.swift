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
        let result = convertor.feetToCentimeters(quantity: 1.0)
        XCTAssertEqual(result, 30.48)
    }
    
    func testFourFeetIsEqualTo121Point92Centimeters() {
        let result = convertor.feetToCentimeters(quantity: 4.0)
        XCTAssertEqual(result, 121.92)
    }
    
    func test6Point5FeetIsEqualTo198Point12Centimeters() {
        let result = convertor.feetToCentimeters(quantity: 6.5)
        XCTAssertEqual(result, 198.12)
    }
    
    func testOneCentimeterIsEqualToPoint0328Feets() {
        let result = convertor.centimetersToFeets(quantity: 1.0)
        XCTAssertEqual(result, 0.0328)
    }
    
    func test172CentimeterIsEqualTo5Point6430Feets() {
        let result = convertor.centimetersToFeets(quantity: 172.0)
        XCTAssertEqual(result, 5.6430)
    }
    
    func testOnePoundIsEqualToPoint4536Kilograms() {
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
        XCTAssertEqual(result, 45.6722)
    }
    
    func testOneKilogramIsEqualTo2Point2046Pounds() {
        let result = convertor.kilogramsToPounds(quantity: 1.0)
        XCTAssertEqual(result, 2.2046)
    }
    
    func test100Point59KilogramsIsEqualTo() {
        let result = convertor.kilogramsToPounds(quantity: 100.59)
        XCTAssertEqual(result, 221.7627)
    }
    
    func test78Point98KilogramsIsNotEqualTo() {
        let result = convertor.kilogramsToPounds(quantity: 78.98)
        XCTAssertNotEqual(result, 174.1208)
        XCTAssertEqual(result, 174.1209)
    }
}
