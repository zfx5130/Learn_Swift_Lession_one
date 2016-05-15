//
//  CalculatorBrain.swift
//  Swift_Lession_one
//
//  Created by dev on 5/15/16.
//  Copyright © 2016 zfx5130. All rights reserved.
//

import Foundation


class CalculatorBrain {

    private enum Op {
        case Operand(Double)
        case SingleOperation(String, Double -> Double)
        case DoubleOperation(String, (Double, Double) -> Double)
    }
    
    private var opStack = [Op]()
    
    private var knownOps = [String: Op]()
    
    init() {
        knownOps["*"] = Op.DoubleOperation("*", *)
        knownOps["/"] = Op.DoubleOperation("/", /)
        knownOps["+"] = Op.DoubleOperation("+", +)
        knownOps["-"] = Op.DoubleOperation("-", -)
        knownOps["√"] = Op.SingleOperation("√", sqrt)
    }
    
    func pushOperand(operand: Double) {
        opStack.append(Op.Operand(operand))
    }
    
    func prefoemOperation(symbol: String) {
        if let operation = knownOps[symbol]  {
            opStack.append(operation)
        }
    }

}