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
    
    func testOnePoundIsEqualTo454GramsRounded() { //453.59gr
        let result = convertor.poundsToGrams(quantity: 1.0)
        XCTAssertEqual(result, 454)
    }
    
    func test4Point56PoundsIsEqualTo2068GramsRounded() { // 2068.4gr
        let result = convertor.poundsToGrams(quantity: 4.56)
        XCTAssertEqual(result, 2068)
    }
    
    func test100Point69PoundsIsEqualTo45672GramsRounded() { //45672.1gr
        let result = convertor.poundsToGrams(quantity:100.69)
        XCTAssertEqual(result, 45672)
    }
    
    func test98Point52PoundIsNotEqualTo44680Grams() { //44680gr
        let result = convertor.poundsToGrams(quantity: 98.52)
        XCTAssertNotEqual(result, 44680)
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
        let result = convertor.kilosToGrams(quantity: 1.0)
        XCTAssertEqual(result, 1000)
    }
    
    func test100Point8KiloIsEqualTo100800Grams() {
        let result = convertor.kilosToGrams(quantity: 100.8)
        XCTAssertEqual(result, 100800)
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
