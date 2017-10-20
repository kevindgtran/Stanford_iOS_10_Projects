//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Kevin Tran on 10/20/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import Foundation

//create a type struct called CalculatorBrain that has all of our calculator "brains" - model - "the apps API"
struct CalculatorBrain {
    
    //create a private "internal" variable called accumulator. Whis is an optional b/c it may/ may not have a value at times.
    private var accumulator: Double?
    
    //function to perform certain operations
    func performOperation(_ symbol: String) {
//        switch operationTitle {
//        case "π":
//            displayValue = Double.pi
//        case "√":
//            displayValue = sqrt(displayValue)
//        default:
//            break
//        }
    
    }
    
    //function that sets the calculators total
    //use mutating to tell swift that this stuct's method can change/ mutate a value within the struct
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    //create a read-only variable
    //make result an optional b/c its value can also be nil at times
    var result: Double? {
        get {
            return accumulator
        }
    }
    
    
    
}
