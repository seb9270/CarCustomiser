//
//  Car.swift
//  CarCustomiser
//
//  Created by Micko, Sebastian (AMM) on 23/01/2024.
//

import Foundation

struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayAttributes() -> String {
        return """
Make: \(make)
Model: \(model)
Top Speed: \(topSpeed)
Acceleration: \(acceleration)
Handling: \(handling)
"""
    }
    
}
