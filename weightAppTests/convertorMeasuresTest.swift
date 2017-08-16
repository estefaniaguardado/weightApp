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
    
    private let convertor = ConvertorMeasure()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
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
    
    func test6Point5FeetIsEqualTo78Inches() {
        let result = convertor.feetToInches(quantity: 6.5)
        XCTAssertEqual(result, 78)
    }
    
    func test78InchesIsEqualTo198CentimetersRounded(){
        let result = convertor.inchesToCentimeters(quantity: 78)
        XCTAssertEqual(result, 198)
    }
    
    func test1Point98FeetsIsEqualTo24InchesRounde(){ //23.76in
        let result = convertor.feetToInches(quantity: 1.98)
        XCTAssertEqual(result, 24)
    }
    
    func test24InchesTo61CentimetersRounded() { //60.96cm
        let result = convertor.inchesToCentimeters(quantity: 24)
        XCTAssertEqual(result, 61)
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
    
    func test2MeterIsEqualTo100Centimeters() {
        let result = convertor.metersToCentimeters(quantity: 2.0)
        XCTAssertEqual(result, 200)
    }

    func test180CentimetersIsEqualTo2MetersRounded () { //1.8mt
        let result = convertor.centimetersToMeters(quantity: 180)
        XCTAssertEqual(result, 2)
    }
    
    func testOneKiloIsEqualTo1000Grams() {
        let result = convertor.kilosToGrams(quantity: 1.0)
        XCTAssertEqual(result, 1000)
    }
    
    func test100Point8KiloIsEqualTo100800Grams() {
        let result = convertor.kilosToGrams(quantity: 100.8)
        XCTAssertEqual(result, 100800)
    }
    
    func test1960GramIsEqualTo2KilosRounded() { //1.96kg
        let result = convertor.gramsToKilos(quantity: 1960)
        XCTAssertEqual(result, 2)
    }
}
