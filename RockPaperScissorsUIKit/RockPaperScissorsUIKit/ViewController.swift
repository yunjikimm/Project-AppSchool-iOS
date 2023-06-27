//
//  ViewController.swift
//  RockPaperScissorsUIKit
//
//  Created by yunjikim on 2023/06/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var computerPickImage: UIImageView! // 컴퓨터 이미지
    @IBOutlet weak var userPickImage: UIImageView! // 유저 이미지
    
    @IBOutlet weak var scissorsButton: UIButton! // 가위 버튼
    @IBOutlet weak var rockButton: UIButton! // 바위 버튼
    @IBOutlet weak var paperButton: UIButton! // 보 버튼
    
    @IBOutlet weak var resetButton: UIButton! // 리셋 버튼
    @IBOutlet weak var startButton: UIButton! // 스타트 버튼
    
    var computerPickRSP: RSP = .rock // 컴퓨터가 고른 가위바위보
    var userPickRSP: RSP = .rock // 유저가 고른 가위바위보
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImages() // 컴퓨터, 유저 이미지 셋팅
        disabledRSPButton() // 가위바위보 버튼 비활성화
        disabledResetButton() // 리셋 버튼 비활성화
    }

    // 게임 시작 후 가위바위보 버튼 눌렀을 때
    @IBAction func choiceRSP(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            userPickRSP = .scissors
        case 1:
            userPickRSP = .rock
        case 2:
            userPickRSP = .paper
        default:
            break
        }
        
        /*
         0: 가위, 1: 바위, 2: 보
         
         사용자 - 컴퓨터 = 1 or -2 승리  (1-0) or (2-1) or (0-2)
         사용자 - 컴퓨터 = 0       무승부 (1-1) or (2-2) or (0-0)
         사용자 - 컴퓨터 = -1 or 2 패배  (0-1) or (1-2) or (2-0)
         */
        
        let condition: Int = userPickRSP.rawValue - computerPickRSP.rawValue
        
        switch condition {
        case 0:
            stateLabel.text = "무승부입니다."
        case -1, 2:
            stateLabel.text = "졌습니다."
        default:
            stateLabel.text = "이겼습니다."
            break
        }
        
        // 게임 후 이미지 변경
        switch computerPickRSP {
        case .scissors:
            computerPickImage.image = UIImage(named: "scissors")
        case .rock:
            computerPickImage.image = UIImage(named: "rock")
        case .paper:
            computerPickImage.image = UIImage(named: "paper")
        }
        
        switch userPickRSP {
        case .scissors:
            userPickImage.image = UIImage(named: "scissors")
        case .rock:
            userPickImage.image = UIImage(named: "rock")
        case .paper:
            userPickImage.image = UIImage(named: "paper")
        }
        
        disabledRSPButton() // 게임 후 가위바위보 버튼 비활성화
        abledResetButton() // 리셋 버튼 활성화
        disabledStartButton() // 스타트 버튼 비활성화
    }
    
    // 리셋 버튼 눌렀을 떄
    @IBAction func resetAction(_ sender: Any) {
        disabledRSPButton() // 가위바위보 버튼 비활성화
        disabledResetButton() // 리셋 버튼 비활성화
        abledStartButton() // 스타트 버튼 활성화
        
        // 컴퓨터, 유저 이미지 초기화
        setImages()
        
        stateLabel.text = "Reset되었습니다. Start 버튼을 눌러주세요."
    }
    
    // 스타트 버튼 눌렀을 떄
    @IBAction func startAction(_ sender: Any) {
        abledRSPButton() // 가위바위보 버튼 활성화
        computerPickRSP = RSP.init(rawValue: Int.random(in: 0...2)) ?? .rock
    }
    
    // 컴퓨터, 유저 이미지 새로 그리기
    func setImages() {
        computerPickImage.image = UIImage(named: "computerStart")
        userPickImage.image = UIImage(named: "userStart")
    }
    
    // 가위바위보 버튼 활성화
    func abledRSPButton() {
        scissorsButton.isEnabled = true
        rockButton.isEnabled = true
        paperButton.isEnabled = true
    }
    // 가위바위보 버튼 비활성화
    func disabledRSPButton() {
        scissorsButton.isEnabled = false
        rockButton.isEnabled = false
        paperButton.isEnabled = false
    }
    
    // 리셋 버튼 활성화
    func abledResetButton() {
        resetButton.isEnabled = true
    }
    // 리셋 버튼 비활성화
    func disabledResetButton() {
        resetButton.isEnabled = false
    }
    
    // 스타트 버튼 활성화
    func abledStartButton() {
        startButton.isEnabled = true
    }
    // 스타트 버튼 비활성화
    func disabledStartButton() {
        startButton.isEnabled = false
    }
    
}

