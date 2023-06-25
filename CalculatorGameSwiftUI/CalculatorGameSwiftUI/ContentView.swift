//
//  ContentView.swift
//  CalculatorGameSwiftUI
//
//  Created by yunjikim on 2023/06/20.
//

import SwiftUI

struct ContentView: View {
    // 문제 풀이 구조체
    struct Problem {
        var x: Int
        var y: Int
        var corretResult: Int
        var wrongResult: Int
        
        init() {
            self.x = Int.random(in: 2...10)
            self.y = Int.random(in: 2...10)
            self.corretResult = x * y
            self.wrongResult = Int.random(in: 10...100)
        }
    }
    
    // 사칙연산 구분을 위한 열거형
    enum Operator: String, CaseIterable {
        case add = "덧셈"
        case subtract = "뺄셈"
        case multiply = "곱셈"
        case divide = "나눗셈"
        
        var id: String { self.rawValue }
    }
    
//    enum Operators {
//        case information(title: String, operation: Operation)
//    }
    
    @State var problem = Problem()
    @State var correct: Int = 0
    @State var wrong: Int = 0
    @State var resultAnswer: String = ""
    
    @State var buttonDisabled: Bool = false
    @State var selectedOperator: String = Operator.add.rawValue
    
    @State var heartCount: Int = 5
    var progress: String {
        get {
            var heart = ""
            if heartCount > 0 {
                heart = String(repeating: "❤️", count: heartCount)
                heartCount -= 1
            }
            return heart
        }
    }
    var randomResult: Int {
        get {
            var answer: Int = 0
            let wrong = Int.random(in: -3...3)
            
            if Double.random(in: 0...1) < 0.5 {
                answer = problem.x + problem.y
            } else {
                answer = problem.x + problem.y + wrong
            }
            return answer
        }
    }
    
    var body: some View {
        VStack {
            let realResult = randomResult
            
            Spacer()
            
            // 사칙연산 선택
            Picker("Select Operato", selection: $selectedOperator) {
                ForEach(Operator.allCases, id: \.id) { value in
                    Text(value.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            .onChange(of: selectedOperator) { _ in
                resetGame()
            }
            
            Spacer()
            
            switch selectedOperator {
            case "덧셈":
                Text("\(problem.x) + \(problem.y) = \(realResult)")
            case "뺄셈":
                Text("\(problem.x) - \(problem.y) = \(realResult)")
            case "곱셈":
                Text("\(problem.x) * \(problem.y) = \(realResult)")
            case "나눗셈":
                Text("\(problem.x) / \(problem.y) = \(realResult)")
            default:
                Text("사칙연산을 선택해주세요.")
            }
            
            Spacer()
            
            // O/X 버튼 스택
            HStack {
                Spacer()
                Button {
                    // 맞추면 correct += 1 / 틀리면 wrong += 1
                    runningCalculate(selectedOperator, realResult, "correct")
                } label: {
                    Text("O")
                }
                .disabled(buttonDisabled)
                Spacer()
                Button {
                    // 틀리면 correct += 1 / 맞으면 wrong += 1
                    runningCalculate(selectedOperator, realResult, "wrong")
                } label: {
                    Text("X")
                }
                .tint(.red)
                .disabled(buttonDisabled)
                Spacer()
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            // 맞추고 틀린 개수
            Text("\(correct)맞춤 \(wrong)틀림")
                .multilineTextAlignment(.center)
                .padding()
            
            // 틀린 횟수 차감
            Text("\(progress)")
                .font(.title)
                .padding()
            
            // 새로운 게임 버튼 (리셋 버튼)
            Button {
                resetGame()
            } label: {
                Text("New Game")
            }

        }
        .font(.largeTitle)
        .padding()
    }
    
    // O/X를 구분하고, 사칙연산을 구분하여 그에 따른 계산 결과
    private func runningCalculate(_ operators: String, _ result: Int, _ isCorrect: String) {
        switch isCorrect {
        case "correct":
            // 맞추면 correct += 1 / 틀리면 wrong += 1
            switch operators {
            case "덧셈":
                if (problem.x + problem.y) == result {
                    correct += 1
                } else {
                    wrong += 1
                    heartCount -= 1
                }
            case "뺄셈":
                if (problem.x - problem.y) == result {
                    correct += 1
                } else {
                    wrong += 1
                    heartCount -= 1
                }
            case "곱셈":
                if (problem.x * problem.y) == result {
                    correct += 1
                } else {
                    wrong += 1
                    heartCount -= 1
                }
            case "나눗셈":
                if (problem.x / problem.y) == result {
                    correct += 1
                } else {
                    wrong += 1
                    heartCount -= 1
                }
            default:
                break
            }
            
        case "wrong":
            // 틀리면 correct += 1 / 맞으면 wrong += 1
            switch operators {
            case "덧셈":
                if (problem.x + problem.y) == result {
                    wrong += 1
                    heartCount -= 1
                } else {
                    correct += 1
                }
            case "뺄셈":
                if (problem.x - problem.y) == result {
                    wrong += 1
                    heartCount -= 1
                } else {
                    correct += 1
                }
            case "곱셈":
                if (problem.x * problem.y) == result {
                    wrong += 1
                    heartCount -= 1
                } else {
                    correct += 1
                }
            case "나눗셈":
                if (problem.x / problem.y) == result {
                    wrong += 1
                    heartCount -= 1
                } else {
                    correct += 1
                }
            default:
                break
            }
            
        default:
            break
        }
        
        problem = Problem()
        if heartCount == 0 { buttonDisabled = true }
    }
    
    // 게임 초기화
    func resetGame() {
        problem = Problem()
        correct = 0
        wrong = 0
        heartCount = 5
        buttonDisabled = false
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//한화면에 임의의 곱셈 계산 식이 나옵니다
//Text("?")
// 예1) 2 x 5 = 10
// 예2) 3 x 10 = 27
// 앞의 숫자 뒤의 숫자 랜덤
// X * Y = A
// X, Y random
// A
// coin
// true A를 그냥
// false A를 의도적으로 가공 +- 3 1이상은 나오게

// 그 아래에는 O / X  버튼이 있습니다
// O / X Button
//Button : O
//Button : X
//@State scoreBoard = Tuple(O: Int , X: Int)

// 이 버튼을 누르면 화면 가장 아래(또는 가장 위)에 있는 다음의 내용에 반영됩니다
//Text("맞춤 \(scoreBoard.o) 틀림 \(scoreBoard.x)")
// 예) 맞춤 3 틀림 23

// 추가기능도 만들어봅시다


// 예1) 곱셈 말고 다른 사칙연산들도 문제에 반영해봅시다
//난이도 조절하고 싶음
//#1 난이도 조절 버튼
//#2 Slider(value: )

// 예2) 맞춤/틀림 숫자 리셋하기
// Button reset

// 예3) 최대 10개의 문제를 제시하고 끝나면 리셋하기만 가능
// 10개의 문제가 끝나면 자동으로 리셋됨

// 예4) 맞춤/틀림 말하기로 알려주기 (오호!, 땡, 꽥, 앗!...)
