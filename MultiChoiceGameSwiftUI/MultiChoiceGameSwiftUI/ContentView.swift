//
//  ContentView.swift
//  MultiChoiceGameSwiftUI
//
//  Created by yunjikim on 2023/06/21.
//

import SwiftUI

struct ContentView: View {
    // 게임 상태
    enum GameStatus {
        case start
        case goingOn
        case done
    }
    
    // 문제 이미지
    struct Problem {
        var image: String
        var answer: Int
    }
    var imageBundle: [Problem] = [
        Problem(image: "one",answer: 1),
        Problem(image: "baby",answer: 2),
        Problem(image: "avengers",answer: 7),
        Problem(image: "three",answer: 3),
        Problem(image: "ghost",answer: 17),
        Problem(image: "trap",answer: 0),
        Problem(image: "family",answer: 38),
    ]
    
    @State var correctCount: Int = 0 // 맞은 개수
    @State var wrongCount: Int = 0 // 틀린 개수
    @State var currentProblemIndex: Int = 0 // 현재 문제 번호
    @State var questionArray: [Int] = [0, 1, 2, 3] // 문항 내용
    @State var currentStatus = GameStatus.start // 게임 상태 초기값 = 시작
    @State var questionButtonDisabled = false // 문항 번호 초기값 = 활성화
    @State var heartCount: Int = 2 // 문제당 맞출 수 있는 기회
    
    // 총 문제 수
    var totalProblems: Int {
        return imageBundle.count
    }
    
    // 총 푼 문제 수
    var solvedProblemNumber: Int {
        return correctCount + wrongCount
    }
    
    var progress: String {
        get {
            var heart = ""
            if heartCount > 0 {
                heart = String(repeating: "🧡", count: heartCount)
                heartCount -= 1
            }
            return heart
        }
    }
    
    var body: some View {
        VStack {
            // 게임이 1)진행중 2)시작,끝 상태를 switch로 구분
            switch currentStatus {
            // 진행중
            case .goingOn:
                HStack {
                    Text("기회: ")
                    Text("\(progress)")
                    Spacer()
                }
                .font(.headline)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
        
                Text("사람은 총 몇 명일까요?")
                    .font(.largeTitle)
                
                Image("\(imageBundle[currentProblemIndex].image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 300)

                HStack {
                    Button {
                        buttonPressed(questionArray[0])
                    } label: {
                        Text("\(questionArray[0])명")
                    }
                    Button {
                        buttonPressed(questionArray[1])
                    } label: {
                        Text("\(questionArray[1])명")
                    }
                    Button {
                        buttonPressed(questionArray[2])
                    } label: {
                        Text("\(questionArray[2])명")
                    }
                    Button {
                        buttonPressed(questionArray[3])
                    } label: {
                        Text("\(questionArray[3])명")
                    }
                }
                .disabled(questionButtonDisabled)
                
                Text("맞춤: \(correctCount) 틀림: \(wrongCount)")
                
                Spacer()
                
                Button {
                    currentStatus = GameStatus.start
                    questionButtonDisabled = false
                    pressedReGame()
                } label: {
                    Text("REGAME")
                }
                .buttonStyle(.bordered)
                .padding()
            
            // 게임 시작, 끝
            case .start, .done:
                Spacer()
                
                Text("사람의 수 맞추기 게임")
                    .font(.largeTitle)
                    .bold()
                
                Button {
                    questionGenerator(problem: imageBundle[currentProblemIndex])
                    currentStatus = GameStatus.goingOn
                } label: {
                    Text("START")
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            
            Spacer()
        }
        .padding()
        .buttonStyle(.borderedProminent)
    }
    
    // 4지선다에서 버튼 클릭했을 때
    // selectedAnswer == questionArray[index]
    
    // [테스크 추가] 문항 버튼을 눌렀을 때에 의존하는 기능들을 개선해봐야 할 점인 듯 합니다.
    func buttonPressed(_ selectedAnswer: Int) {
        guard currentProblemIndex != imageBundle.count-1 else {
            // 현재 문제 번호와 이미지(문제)의 총 개수와 같아질 때 (문제 다 풀었을 떄!)
            heartCount -= 1
            
            if heartCount == 0 {
                questionButtonDisabled = true
            }
            
            return
        }
        
        if selectedAnswer == imageBundle[currentProblemIndex].answer {
            correctCount += 1

            currentProblemIndex += 1
            questionGenerator(problem: imageBundle[currentProblemIndex])
        } else {
            heartCount -= 1
            
            if heartCount == 0 {
                wrongCount += 1

                currentProblemIndex += 1
                questionGenerator(problem: imageBundle[currentProblemIndex])
            }
        }
    }
    
    // 선택지 변경
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
        
        heartCount = 2
    }
    
    // REGAME 버튼 클릭시 문제 초기화
    func pressedReGame() {
        correctCount = 0
        wrongCount = 0
        currentProblemIndex = 0
        heartCount = 2
        questionArray = [0, 1, 2, 3]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 [당장 할 테스크]
 - buttonPressed 함수내 heartCount를 처리하는 과정에서 반복적인 코드를 개선할 수 있지 않을까?
 - 선택한 버튼은 disable 어떻게 하는지 감도 안 옴
 */

/*
 [완료 테스크]
 - 4지선다 객관식
 
 - 문제는 하나 풀면 다음 문제 나타나야 함
 
 - 몇개 맞췄나 스코어 실시간 보여주기
 
 - start, goingon, done 상태 처리
 
 - 리게임 버튼 클릭시 문제 초기화
 
 - 번호 문항이 랜덤하게 나오게 하기
 
 - 틀린 문제를 고르면 한 번 더 기회를 줌
    - @State var heartCount: Int = 2 (문제당 두 번의 기회)
    - 틀렸을 때 heartCount -= 1
    - heartCount가 0일 때 문제 넘어가고, 마지막 문제에선 문항 버튼 비활성화
      (선택한 버튼 비활성화 하고 싶지만 일단!!!)
 */

/*
 [시도해 볼 테스크]
 - 사진 랜덤 shuffle
 - 틀린 문제를 고르면 한 번 더 기회를 줌 + 선택한 버튼은 disable
 */

/*
  [문제]
  객관식 퀴즈퀴즈 프로그램 만들기?
  UIKit/SwiftUI 둘다 만드시면서, 동일한 문제집 코드를 공유하도록 하시길 권장합니다

  1. 4지선다 또는 5지선다 또는 그밖의 알아서 정하세요 (O)
  
  2. 문제는 하나 풀면 다음 문제 나타나야합니다 (O)
     문제는 미리미리 많이 준비될수록 좋겠죠
  
  3. 음성으로 문제 읽어주기
  
  4. 몇개 맞췄나 스코어 실시간 보여주기 (O)
  
  5. 3개 연속 틀리면 꽝. 처음부터 다시 강제 리셋! (O)
  
  6. 10번의 문제만 준다
  
  7. 문자별로 난이도를 줘서 스테이지 올라가는 방식으로 게임성 강화
  
  8. 문제에 참고 이미지를 보여주는 것도 괜찮아요 : AsyncImage
 */
