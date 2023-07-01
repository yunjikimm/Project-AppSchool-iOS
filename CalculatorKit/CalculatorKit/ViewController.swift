//
//  ViewController.swift
//  CalculatorKit
//
//  Created by yunjikim on 2023/06/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel! // 결과 텍스트
    
    var number1: Double = 0
    var number2: Double = 0
    var isPressedButtonOpr: Bool = false
    var tempString: String = ""
    var selectOpr: String = ""
    
    var oprFunc: (Double, Double) -> Double = { (n1: Double, n2: Double) -> Double in
        return n1 + n2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 숫자 버튼
    @IBAction func pressButtonNumber(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else {
            return
        }
        
        if isPressedButtonOpr {
            tempString = ""
            isPressedButtonOpr = false
        }
        
        tempString += "\(number)"
        resultLabel.text = tempString
    }
    
    // 사칙연산 버튼
    @IBAction func pressButtonOperation(_ sender: UIButton) {
        guard let tempStr = Double(tempString) else {
            return
        }
        number1 = tempStr
        
        var oper = sender.titleLabel?.text ?? ""
        
        switch oper {
        case "➗":
            oprFunc = { (n1: Double, n2: Double) -> Double in
                return n1 / n2
            }
        case "✖️":
            oprFunc = { (n1: Double, n2: Double) -> Double in
                return n1 * n2
            }
        case "➖":
            oprFunc = { (n1: Double, n2: Double) -> Double in
                return n1 - n2
            }
        case "➕":
            oprFunc = { (n1: Double, n2: Double) -> Double in
                return n1 + n2
            }
        default:
            break
        }
        
        selectOpr = oper
        isPressedButtonOpr = true
    }
    
    // 리셋 버튼
    @IBAction func pressButtonReset(_ sender: UIButton) {
        number1 = 0
        number2 = 0
        tempString = ""
        resultLabel.text = ""
        isPressedButtonOpr = false
    }
    
    // 계산 버튼
    @IBAction func pressButtonCalc(_ sender: UIButton) {
        guard let tempStr = Double(tempString) else {
            return
        }
        number2 = tempStr
        tempString = ""
        
        guard selectOpr != "➗" || number2 != 0 else {
            pressButtonReset(sender)
            resultLabel.text = "0으로 나눌 수 없습니다."
            return
        }
        
        var result: Double = oprFunc(number1, number2)
        number1 = result
        
        if floor(result) == result {
            resultLabel.text = "\(Int(result))"
        } else {
            resultLabel.text = "\(result)"
        }
        
    }
    
}

