//
//  ViewController.swift
//  Swift_Lession_one
//
//  Created by dev on 4/21/16.
//  Copyright © 2016 zfx5130. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var brain = CalculatorBrain()
    
    //var 变量  let 常量
    var displayZero: Bool = false;
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle! //这里!类似强制转换的意思，加!类型有optional到对应的string类型，
        if displayZero {
            display.text = display.text! + digit
        } else {
            display.text = digit
            displayZero = true  
        }
    }
    
    
    @IBAction func enter() {
        displayZero = false
        if let result =  brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            displayZero = false
        }
    }
    
    @IBAction func opreate(sender: UIButton) {
        if displayZero {
            enter()
        }
  
        if let operation = sender.currentTitle {
            if let result = brain.prefoemOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }

}

