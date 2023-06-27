//
//  ContentView.swift
//  RockPaperScissorsSwiftUI
//
//  Created by yunjikim on 2023/06/26.
//

import SwiftUI

struct ContentView: View {
    @State var stateLabel: String = "Start 버튼을 눌러주세요."
    
    @State var RSPButtonDisabled: Bool = true // 버튼 활성화/비활성화
    @State var resetButtonDisabled: Bool = true // reset 버튼 활성화/비활성화
    @State var startButtonDisabled: Bool = false // start 버튼 활성화/비활성화
    
    @State var computerPickImage: String = "computerStart" // 컴퓨터 이미지
    @State var userPickImage: String = "userStart" // 유저 이미지
    
    @State var computerPickRSP: RSP = .rock // 컴퓨터가 고른 가위바위보
    @State var userPickRSP: RSP = .rock // 유저가 고른 가위바위보
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("\(stateLabel)")
                .frame(height: 100)
            
            HStack {
                VStack {
                    Image("\(computerPickImage)")
                        .resizable()
                        .frame(width: 150, height: 150)
                    Text("컴퓨터")
                }
                .padding()
                VStack {
                    Image("\(userPickImage)")
                        .resizable()
                        .frame(width: 150, height: 150)
                    Text("나")
                }
                .padding()
            }
            
            Spacer()
            
            HStack {
                Button {
                    choiceRSP(rsp: RSP.scissors)
                } label: {
                    Image("scissors")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }
                Button {
                    choiceRSP(rsp: RSP.rock)
                } label: {
                    Image("rock")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }
                Button {
                    choiceRSP(rsp: RSP.paper)
                } label: {
                    Image("paper")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }
            }
            .disabled(RSPButtonDisabled)
            
            Spacer()
            
            HStack {
                Button {
                    resetAction()
                } label: {
                    Text("Reset")
                }
                .padding()
                .tint(.red)
                .disabled(resetButtonDisabled)
                
                Button {
                    startAction()
                } label: {
                    Text("Start")
                }
                .padding()
                .disabled(startButtonDisabled)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
        }
        .padding()
        .background(Color.lightyellow)
    }
    
    // 리셋 버튼 눌렀을 떄
    func resetAction() {
        RSPButtonDisabled = true // 가위바위보 버튼 활성화 -> 비활성화
        
        // 이미지 초기화
        computerPickImage = "computerStart"
        userPickImage = "userStart"
        
        // 리셋, 스타트 버튼 초기화
        resetButtonDisabled = true // reset 버튼 활성화 -> 비활성화
        startButtonDisabled = false // start 버튼 비활성화 -> 활성화
        
        stateLabel = "Reset되었습니다. Start 버튼을 눌러주세요."
    }
    
    // 스타트 버튼 눌렀을 떄
    func startAction() {
        RSPButtonDisabled = false // 가위바위보 버튼 비활성화 -> 활성화
        resetButtonDisabled = true // reset 버튼 활성화 -> 비활성화
        computerPickRSP = RSP.init(rawValue: Int.random(in: 0...2)) ?? .rock
    }
    
    // 게임 시작 후 가위바위보 버튼 눌렀을 때
    func choiceRSP(rsp: RSP) {
        userPickRSP = rsp
        
        /*
         0: 가위, 1: 바위, 2: 보
         
         사용자 - 컴퓨터 = 1 or -2 승리  (1-0) or (2-1) or (0-2)
         사용자 - 컴퓨터 = 0       무승부 (1-1) or (2-2) or (0-0)
         사용자 - 컴퓨터 = -1 or 2 패배  (0-1) or (1-2) or (2-0)
         */
        
        let condition: Int = userPickRSP.rawValue - computerPickRSP.rawValue
        
        switch condition {
        case 0:
            stateLabel = "무승부입니다."
        case -1, 2:
            stateLabel = "졌습니다."
        default:
            stateLabel = "이겼습니다."
            break
        }
        
        // 게임 후 이미지 변경
        switch computerPickRSP {
        case .scissors:
            computerPickImage = "scissors"
        case .rock:
            computerPickImage = "rock"
        case .paper:
            computerPickImage = "paper"
        }
        
        switch userPickRSP {
        case .scissors:
            userPickImage = "scissors"
        case .rock:
            userPickImage = "rock"
        case .paper:
            userPickImage = "paper"
        }
        
        RSPButtonDisabled = true // 게임 후 가위바위보 버튼 비활성화
        resetButtonDisabled = false // reset 버튼 비활성화 -> 활성화
        startButtonDisabled = true // start 버튼 활성화 -> 비활성화
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
