//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Kevin Tran on 10/20/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import Foundation

//create a struct called CalculatorBrain that has all of our calculator "brains" - model - "the apps API"
struct CalculatorBrain {
    
    //create a private "internal" variable called accumulator. Whis is an optional b/c it may/ may not have a value at times.
    private var accumulator: Double?
    
    //create a new type enum that has 2 potential types and associated values
    private enum Operation {
        case constant(Double) //this allows us to create associated values with each enum case
        case unaryOperation((Double) -> (Double))
        case binaryOperation((Double, Double) -> Double)
        case equals
    }
    
    //create a dictionary of all the operations to avoid a really long switch case
    private var operations: [String: Operation] = [
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt),
        "cos" : Operation.unaryOperation(cos),
        //closures instead of creating multiple methods to call, infering the types from the enum
        "±" : Operation.unaryOperation({ -$0 }),
        "*" : Operation.binaryOperation({ $0 * $1 }),
        "/" : Operation.binaryOperation({ $0 / $1 }),
        "+" : Operation.binaryOperation({ $0 + $1 }),
        "-" : Operation.binaryOperation({ $0 - $1 }),
        "=" : Operation.equals
    ]
    
    //Mutating method because it changes values within the struct (we need to tell swift that this struct copy is going to change its values)
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function):
                if accumulator != nil {
                    pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .equals:
                performPendingBinaryOperation()
            }
        }
    }
    
    mutating private func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation!.perform(with: accumulator!)
            pendingBinaryOperation = nil
        }
    }
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    //create another struct to be the pending binary operation ie 5*3...
    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
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
