//
//  ViewController.swift
//  FiveQuiz
//
//  Created by yunjikim on 2023/06/21.
//

/*
 숫자를 맞춰 보세요 - label
 0 1 2 3 ... 10 - button
 맞췄습니다/틀렸습니다 - label
 */

import UIKit

class ViewController: UIViewController {
    var resultNumberArray: [Int] = [0, 0, 0] // 정답 배열
    var userNumbers: [Int] = [-1, -1, -1] // 선택이 안 된 초기 상태로 설정! 0부터 선택되었다고 설정!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    // view가 보이기 전에 처맇라 내용들을 여기 담아주세요.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
    }

    @IBAction func pressNumber1Button(_ sender: UIButton) {
        let userNumber = sender.tag
        updateUserNumbers(group: 0, number: userNumber)
    }
    
    @IBAction func pressNumber2Button(_ sender: UIButton) {
        let userNumber = sender.tag
        updateUserNumbers(group: 1, number: userNumber)
    }
    
    @IBAction func pressNumber3Button(_ sender: UIButton) {
        let userNumber = sender.tag
        updateUserNumbers(group: 2, number: userNumber)
    }
    
    @IBAction func pressNewGamButton(_ sender: Any) {
        startGame()
    }
    
    func startGame() {
        resultLabel.text = "숫자를 선택하세요!!"
        resultNumberArray = [
            Int.random(in: 0...10),
            Int.random(in: 0...10),
            Int.random(in: 0...10)
        ]
        userNumbers = [-1, -1, -1]
        print(resultNumberArray)
    }
    
    func updateUserNumbers(group: Int, number: Int) {
        userNumbers[group] = number
        
        var correctCount: Int = 0
        
        for index in 0...2 {
            if resultNumberArray[index] == userNumbers[index] {
                correctCount += 1
            }
        }
        
        if correctCount > 2 {
            resultLabel.text = "모든 숫자를 맞췄습니다."
        } else {
            
            var resultText: String = ""
            
            for userNumber in userNumbers {
                if userNumber > -1 {
                    resultText += " \(userNumber) "
                } else {
                    resultText += " _ "
                }
            }
            resultText += " : \(correctCount)개 맞춤"
            resultLabel.text = resultText
            
        }
    }
    
}
