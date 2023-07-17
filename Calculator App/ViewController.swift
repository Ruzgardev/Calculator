//
//  ViewController.swift
//  Calculator App
//
//  Created by Hüseyin Uludağ on 12.07.2023.
//

import UIKit

enum Operation: String{
    case Add = "+"
    case Subtract = " - "
    case Divide = "/"
    case Multiply = "*"
    case Null = "Null"
}

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperations : Operation = .Null
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outputLbl.text = "0"
       
    }
    
    @IBAction func numbersPressed(_ sender: RoundButton) {
        if runningNumber.count <= 8 {
            runningNumber += "\(sender.tag)"
            outputLbl.text = runningNumber
        }
    }
    
    @IBAction func allClearPressed(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperations = .Null
        outputLbl.text = "0"
    }
    
    
    @IBAction func dotPressed(_ sender: RoundButton) {
        if runningNumber.count <= 7 {
            runningNumber += "."
            outputLbl.text = runningNumber
        }
    }
 
    @IBAction func dividePressed(_ sender: RoundButton) {
        operation(operation: .Divide  )
    }
    @IBAction func multiplayPressed(_ sender: RoundButton) {
        operation(operation: .Multiply)
    }
    
    @IBAction func subtractPressed(_ sender: RoundButton) {
        operation(operation: .Subtract)
    }
    
    @IBAction func plusPressed(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    
    @IBAction func equalPressed(_ sender: Any) {
        operation(operation: currentOperations)
    }
    
    func operation (operation: Operation ){
        if currentOperations != .Null{
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                if currentOperations == .Add{
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }else if currentOperations == .Subtract{
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }else if currentOperations == .Multiply{
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }else if currentOperations == .Divide{
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int(Double(result)!))"
                }
                outputLbl.text = result
            }
            currentOperations = operation
        }else{
            leftValue = runningNumber
            runningNumber = ""
            currentOperations = operation
        }
    }
}

