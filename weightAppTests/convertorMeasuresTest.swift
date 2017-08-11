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
    
    func testOneFeetIsEqualTo30CentimetersRounded() { //30.48cm
        let result = convertor.feetToCentimeters(quantity: 1.0)
        XCTAssertEqual(result, 30)
    }
    
    func testFourFeetIsEqualTo122CentimetersRounded() { //121.92cm
        let result = convertor.feetToCentimeters(quantity: 4.0)
        XCTAssertEqual(result, 122)
    }
    
    func test6Point5FeetIsEqualTo198CentimetersRounded() { //198.12cm
        let result = convertor.feetToCentimeters(quantity: 6.5)
        XCTAssertEqual(result, 198)
    }
    
    func test156CentimeterIsEqualTo5FeetsRounded() { //5.11fts
        let result = convertor.centimetersToFeets(quantity: 156)
        XCTAssertEqual(result, 5)
    }
    
    func testOneCentimeterIsEqualTo0FeetsRounded() { //0.03fts
        let result = convertor.centimetersToFeets(quantity: 1)
        XCTAssertEqual(result, 0)
    }
    
    func test172CentimeterIsEqualTo6FeetsRounded() { //5.64fts
        let result = convertor.centimetersToFeets(quantity: 172)
        XCTAssertEqual(result, 6)
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
    
    func testOneCentimeterIsEqualToPoint0010Meters() {
        let result = convertor.centimetersToMeters(quantity: 1.0, decimals:2)
        XCTAssertEqual(result, 0.01)
    }
    
    func test180CentimetersIsEqualTo1Point8Meters() {
        let result = convertor.centimetersToMeters(quantity: 180.0, decimals:2)
        XCTAssertEqual(result, 1.80)
    }
    
    func testOneKiloIsEqualTo1000Grams() {
        let result = convertor.kilosToGrams(quantity: 1.0, decimals: 2)
        XCTAssertEqual(result, 1000.00)
    }
    
    func test100Point8KiloIsEqualTo100800Grams() {
        let result = convertor.kilosToGrams(quantity: 100.8, decimals: 2)
        XCTAssertEqual(result, 100800.00)
    }
    
    func testOneGramIsEqualToPoint001Kilos() {
        let result = convertor.gramsToKilos(quantity: 1.0, decimals: 3)
        XCTAssertEqual(result, 0.001)
    }
    
    func test196GramIsEqualToPoint19Kilos() {
        let result = convertor.gramsToKilos(quantity: 196.0, decimals: 4)
        XCTAssertEqual(result, 0.1960)
    }
}
