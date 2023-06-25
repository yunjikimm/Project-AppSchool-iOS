//
//  ViewController.swift
//  MultiChoiceGameUIKit
//
//  Created by yunjikim on 2023/06/22.
//

/*
 [테스크]
 - swiftui의 변수나 객체 등 가져와서 화면과 연결
 */

import UIKit

// 게임 상태
//enum GameStatus {
//    case start
//    case goingOn
//    case done
//}

// 문제 이미지
struct Problem {
    var image: String
    var answer: Int
}

class ViewController: UIViewController {
    // 문제 이미지
    var imageBundle: [Problem] = [
        Problem(image: "one",answer: 1),
        Problem(image: "baby",answer: 2),
        Problem(image: "avengers",answer: 7),
        Problem(image: "three",answer: 3),
        Problem(image: "ghost",answer: 17),
        Problem(image: "trap",answer: 0),
        Problem(image: "family",answer: 38),
    ]

    @IBOutlet weak var correctCountLabel: UILabel!
    @IBOutlet weak var wrongCountLabel: UILabel!
    @IBOutlet weak var problemImageView: UIImageView!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    var correctCount: Int = 0 // 맞은 개수
    var wrongCount: Int = 0 // 틀린 개수
    var currentProblemIndex: Int = 0 // 현재 문제 번호
    var questionArray: [Int] = [0, 1, 2, 3] // 문항 내용
    
    var totalProblems: Int { // 총 문제 수
        imageBundle.count
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        problemImageView.image = UIImage(named: imageBundle[currentProblemIndex].image)
        button1.setTitle("\(questionArray[0])명", for: .normal)
        button2.setTitle("\(questionArray[1])명", for: .normal)
        button3.setTitle("\(questionArray[2])명", for: .normal)
        button4.setTitle("\(questionArray[3])명", for: .normal)
        
        print("currentProblemIndex: \(currentProblemIndex)")
    }

    // MARK: - 4지선다에서 버튼 클릭했을 때
    @IBAction func pressedButton(_ sender: UIButton) {
        let selectedIndex = sender.tag
        
        guard currentProblemIndex != imageBundle.count-1 else {
            // 현재 문제 번호와 이미지(문제)의 총 개수와 같아질 때 (문제 다 풀었을 떄!)
            if questionArray[selectedIndex] == imageBundle[currentProblemIndex].answer {
                correctCount += 1
            } else {
                wrongCount += 1
            }
            
            currentProblemIndex = 0
            
            return
        }
        
        if questionArray[selectedIndex] == imageBundle[currentProblemIndex].answer {
            correctCount += 1
        } else {
            wrongCount += 1
        }
        
        correctCountLabel.text = "\(correctCount)"
        wrongCountLabel.text = "\(wrongCount)"
        
        currentProblemIndex += 1
        questionGenerator(problem: imageBundle[currentProblemIndex])
        self.loadView()
        
    }
    
    // MARK: - REGAME 버튼 클릭시 문제 초기화
    @IBAction func pressedReGameButton(_ sender: Any) {
        correctCount = 0
        wrongCount = 0
        currentProblemIndex = 0
        questionArray = [0, 1, 2, 3]
        
        correctCountLabel.text = "\(correctCount)"
        wrongCountLabel.text = "\(wrongCount)"
    }
    
    // MARK: - 선택지 변경
    func questionGenerator(problem: Problem) {
        let randomIndex = Int.random(in: 0...3)
        let realAnswer = problem.answer
        var tempQuestionArray = [0, 0, 0, 0]
        
        /* 만약 정답이 0~2일 때 tempQuestionArray.count는 3이기 때문에 음수가 나올 수 있다.
         때문에 0~2일 때와 나머지를 분기 처리해주었다. */
        switch realAnswer {
        case 0...2:
            tempQuestionArray = [0, 1, 2, 3]
        default:
            for i in 0..<tempQuestionArray.count {
                tempQuestionArray[i] = realAnswer + (i - randomIndex)
            }
            tempQuestionArray[randomIndex] = realAnswer
        }
        
        tempQuestionArray.shuffle()
        questionArray = tempQuestionArray
        
        self.loadView()
    }
    
}


