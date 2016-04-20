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
        print("digit", digit) //打印方式， swift中一般不用写分号，在语句结尾。
        if displayZero {
            display.text = display.text! + digit
        } else {
            display.text = digit
            displayZero = true  
        }
    }
    
    
}

