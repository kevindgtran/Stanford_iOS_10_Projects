//
//  ViewController.swift
//  Calculator
//
//  Created by Kevin Tran on 10/18/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //property (IBOutlet) for display textLabel, with minimum font size for large numbers
    @IBOutlet weak var display: UILabel!
    
    //boolean variable to control if userIsTyping is true then continue adding button's current title. If false reset display to just button's current title and set userTyping is true, so we can keep adding more button labels
    var userIsTyping = false
    
    //method (IBAction) for when any of the digit buttons are pressed
    @IBAction func touchDigit(_ sender: UIButton) {
        if let button = sender.currentTitle { //optional binding to safely unwrap currentTitle optional
            if userIsTyping {
                let textInLabel = display.text! //force unwrap text optional
                display.text = textInLabel + button
            } else {
                display.text = button
                userIsTyping = true
            }
        }
    }
    
    //Computed property: Takes in newValue and returns it as a Double
    //gets and returns variable type (casting it to specific type to avoid constantly casting values in code)
    //sets the display.text as a casted string by passing in the newValue
    var displayValue: Double {
        get {
            return Double(display.text!)! //returns the variable
        }
        set {
            display.text = String(newValue) //sets the variable
        }
    }
    
    //Create a variable to the model "brain". Private as we only want this controller to access the model "brain". This is the communication from the controller to the model
    private var brain = CalculatorBrain()
    
    @IBAction func operation(_ sender: UIButton) {
        //if the user is in the middle of typing then tell the brain to set the operand to the display
        if userIsTyping {
            brain.setOperand(displayValue)
            userIsTyping = false //set the userIsTyping to false on all operations
        }
        //else if the user is not typing tell the brain to perform operation
        if let operationTitle = sender.currentTitle {
            brain.performOperation(operationTitle)
        }
        
        if let result = brain.result {
            displayValue = result
        }
    }
}

//notes:
//Ctrl + I cleans up code indentation
//Alt + source file shows that source file in the next assistant editor screen
