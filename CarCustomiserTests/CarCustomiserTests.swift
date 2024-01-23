//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Micko, Sebastian (AMM) on 23/01/2024.
//

import XCTest

final class CarCustomiserTests: XCTestCase {

    func testNewCarGivesCarWithSetAttributes() {
        //arrange
        //act
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        //assert
        XCTAssertEqual(car.make, "Mazda")
        XCTAssertEqual(car.model, "MX-5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)
        
    }
    
    func testCarOutputsCorrectInfo() {
        //arrange
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        let expected = """
Make: Mazda
Model: MX-5
TopSpeed: 125
Acceleration: 7.7
Handling: 5
"""
        //act
        let stats = car.displayAttributes()
        //XCTAssertEqual(stats, expected)
         
    }
}
