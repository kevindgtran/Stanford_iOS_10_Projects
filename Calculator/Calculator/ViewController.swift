//
//  ViewController.swift
//  Calculator
//
//  Created by Kevin Tran on 10/18/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //property (IBOutlet) for display textLabel, with minimum font size for very large numbers
    @IBOutlet weak var display: UILabel!
    
    //boolean variable to control if userIsTyping is true then continue adding button's current title. If false reset display to just button's current title and set userTyping is true, so we can keep adding more button labels
    var userIsTyping = false
    
    //method (IBAction) for all of the no# buttons (copied one connection)
    @IBAction func touchDigit(_ sender: UIButton) {
        if let button = sender.currentTitle { //optional binding to safely unwrap button currentTitle optional value
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
        //if the user is typing then tell the brain to set the operand to the display
        if userIsTyping {
            brain.setOperand(displayValue)
            userIsTyping = false //set the userIsTyping to false on all operations
        }
        //then safely unwrapp the currentTitle, set it to operationTitle and pass it to brain.performOperation
        if let operationTitle = sender.currentTitle {
            brain.performOperation(operationTitle)
        }
        
        //then if there is a result, set it to result and set the displayValue to the result
        if let result = brain.result {
            displayValue = result
        }
    }
}

//notes:
//Ctrl + I cleans up code indentation
//Alt + source file shows that source file in the next assistant editor screen
