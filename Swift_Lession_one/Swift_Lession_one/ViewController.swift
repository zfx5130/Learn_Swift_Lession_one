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
    
    var allNumber = [Double]()
    
    
    @IBAction func enter() {
        displayZero = false
        allNumber.append(displayValue)
        print("\(allNumber)")
    }
    
    var displayValue: Double {
        get {
            print("adf++++++afadsfas")
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            print("adfafadsfas")
            display.text = "\(newValue)"
            displayZero = false
        }
    }
    
    @IBAction func opreate(sender: UIButton) {
        let opreateValue = sender.currentTitle!
        if displayZero {
            enter()
        }
        switch opreateValue {
        case "*": preformOperate {$0 * $1}
        case "/": preformOperate {$1 / $0}
        case "+": preformOperate {$0 + $1}
        case "-": preformOperate {$1 - $0}
        case "√": preformOperateSqrt { sqrt($0) }
        default: break
        }
        
    }
    
    func preformOperate(opreation: (Double, Double) -> Double) {
        if allNumber.count >= 2 {
            displayValue = opreation(allNumber.removeLast(), allNumber.removeLast())
            enter()
        }
    }
    
    func preformOperateSqrt(opreation: Double -> Double) {
        if allNumber.count >= 1 {
            displayValue = opreation(allNumber.removeLast())
            enter()
        }
    }
}

