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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIdealWeightToWomen172cm() {
        let data = IdealWeightByLoretz(user: Gender.female, userHeight: 172)
        let result = data.calculateIdealWeight()
        XCTAssertEqual(result, 61.0)
    }
    
    func testIdealWeightToMale180cm() {
        let data = IdealWeightByLoretz(user: Gender.male, userHeight: 180)
        let result = data.calculateIdealWeight()
        XCTAssertEqual(result, 72.5)
    }
}
