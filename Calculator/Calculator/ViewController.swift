//
//  ViewController.swift
//  Calculator
//
//  Created by Kevin Tran on 10/18/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //property for display text label
    @IBOutlet weak var display: UILabel!
    
    var userIsTyping = false
    
    //method for when buttons are pressed
    @IBAction func touchDigit(_ sender: UIButton) {
        if let button = sender.currentTitle {
            print("\(button) was pressed")
            //if the user is not typing then keep appending to the display text
            if userIsTyping {
                let textInLabel = display.text!
                display.text = textInLabel + button
            } else {
                //if the user is in the middle of typing then set the display text to the button title
                display.text = button
                userIsTyping = true
            }
        }
    }
    
    //create a computed property that sets the newValue passed in to a string then to display.text. Then returns that display.text as a double.
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func operation(_ sender: UIButton) {
        //set the userIsTyping to false on all operations
        userIsTyping = false
        if let operationTitle = sender.currentTitle {
            switch operationTitle {
            case "π":
                displayValue = Double.pi
            //display.text = String(Double.pi)
            case "√":
                displayValue = sqrt(displayValue)
                //let doubleValue = Double(display.text!)!
            //display.text = String(Int(sqrt(doubleValue)))
            default:
                break
            }
        }
    }
}

