//
//  CalculatorBrain.swift
//  Swift_Lession_one
//
//  Created by dev on 5/15/16.
//  Copyright © 2016 zfx5130. All rights reserved.
//

import Foundation


class CalculatorBrain {

    private enum Op: CustomStringConvertible {
        case Operand(Double)
        case SingleOperation(String, Double -> Double)
        case DoubleOperation(String, (Double, Double) -> Double)
        
        var description: String {
            get {
                switch self {
                case .Operand(let operand):
                    return "\(operand)"
                case .SingleOperation(let symbol, _):
                    return symbol
                case .DoubleOperation(let symbol, _):
                    return symbol
                }
            }
        }
    }
    
    private var opStack = [Op]()
    
    private var knownOps = [String: Op]()
    
    init() {
        func learnOp(op: Op) {
            knownOps[op.description] = op
        }
        learnOp(Op.DoubleOperation("*", *))
        knownOps["/"] = Op.DoubleOperation("/", /)
        knownOps["+"] = Op.DoubleOperation("+", +)
        knownOps["-"] = Op.DoubleOperation("-", -)
        knownOps["√"] = Op.SingleOperation("√", sqrt)
    }
    
   private func evaluate(ops: [Op]) -> (result: Double?, remainingOps: [Op]) {
      
        if !ops.isEmpty {
            var remainingOps = ops
            let op = remainingOps.removeLast()
            switch op {
            case .Operand(let operand):
                return (operand, remainingOps)
            case .SingleOperation(_, let operation):
                let operandEvaluation = evaluate(remainingOps)
                if let operand = operandEvaluation.result {
                    return (operation(operand), operandEvaluation.remainingOps)
                }
            case .DoubleOperation(_, let operation):
                let op1Evaluation = evaluate(remainingOps)
                if let operand1 = op1Evaluation.result {
                    let op2Evaluation = evaluate(op1Evaluation.remainingOps)
                    if let operand2 = op2Evaluation.result {
                        return (operation(operand1, operand2), op2Evaluation.remainingOps)
                    }
                }
            }
        }
        return (nil, ops)
    }
    
    func evalute() -> Double? {
        let evaluateResult = evaluate(opStack)
        //let (result, _) = evaluate(opStack) return result
        print("\(opStack) = \(evaluateResult.result) with \(evaluateResult.remainingOps) left over")
        return evaluateResult.result
    }
    
    
    func pushOperand(operand: Double) -> Double? {
        opStack.append(Op.Operand(operand))
        return evalute()
    }
    
    func prefoemOperation(symbol: String) -> Double? {
        if let operation = knownOps[symbol]  {
            opStack.append(operation)
        }
        return evalute()
    }

}