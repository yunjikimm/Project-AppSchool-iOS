//
//  ContentView.swift
//  PerfactMBTI
//
//  Created by yunjikim on 2023/06/22.
//

import SwiftUI

struct ContentView: View {
    // mbti별 카운트
    @State var iCount: Int = 0
    @State var eCount: Int = 0
    @State var nCount: Int = 0
    @State var sCount: Int = 0
    @State var tCount: Int = 0
    @State var fCount: Int = 0
    @State var pCount: Int = 0
    @State var jCount: Int = 0
    
    @State var currentQuestionIndex: Int = 0 // 현재 문제 인덱스
    @State var currentStatus: Status = .start // 현재 화면 상태
    
    var resultMyMBTI: String { // 내 mbti 결과
        get {
            var result:String = ""
            
            if iCount > eCount {
                result += Mbti.I.rawValue
            } else {
                result += Mbti.E.rawValue
            }
            
            if nCount > sCount {
                result += Mbti.N.rawValue
            } else {
                result += Mbti.S.rawValue
            }
            
            if tCount > fCount {
                result += Mbti.T.rawValue
            } else {
                result += Mbti.F.rawValue
            }
            
            if pCount > jCount {
                result += Mbti.P.rawValue
            } else {
                result += Mbti.J.rawValue
            }
            
            return result
        }
    }
    
    var bestCombMbti: String { // 나와 잘 맞는 mbti
        get {
            var best: String = ""
            
            for comb in combinations {
                if comb.mbti == resultMyMBTI {
                    best = comb.best
                }
            }
            
            return best
        }
    }
    
    var worstCombMbti: String { // 나와 잘 안맞는 mbti
        var worst: String = ""
        
        for comb in combinations {
            if comb.mbti == resultMyMBTI {
                worst = comb.worst
            }
        }
        
        return worst
    }
    
    var body: some View {
        VStack {
            switch currentStatus {
            case .start:
                // 퀴즈 시작 화면
                ZStack {
                    LottieView(name: "lookingForSomething", loopMode: .loop)
                        .scaleEffect(0.5)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 150, trailing: 0))
                    
                    VStack {
                        Text("나와 잘 맞는 MBTI는?")
                            .padding()
                        
                        Button {
                            currentStatus = .goingOn
                        } label: {
                            Text("테스트 시작")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.yellow)
                    }
                    .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                }
                .font(.system(size: 34, weight: .black, design: .rounded))
                
            case .goingOn:
                // 퀴즈 진행중인 화면
                Text("\(mbtiQuestionare[currentQuestionIndex].questionnaire)")
                    .frame(width: 350, height: 200)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                VStack {
                    Button {
                        stackedScore(inputCase: mbtiQuestionare[currentQuestionIndex].selectO)
                    } label: {
                        Text("그렇다")
                    }
                    .tint(.yellow)
                    Button {
                        stackedScore(inputCase: mbtiQuestionare[currentQuestionIndex].selectX)
                    } label: {
                        Text("아니다")
                    }
                    .tint(.secondary)
                    .padding()
                }
                .buttonStyle(.borderedProminent)
                .font(.system(size: 28, weight: .bold, design: .rounded))
                
            case .loading:
                // 결과 화면 전 로딩 화면
                LottieView(name: "loading", loopMode: .loop)
                    .scaleEffect(0.3)
                
            case .end:
                // 퀴즈 끝 결과 화면
                Spacer()
                
                VStack {
                    Text("나의 MBTI는?")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                    
                    Text("\(resultMyMBTI)")
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                }
                
                Spacer()
                
                HStack {
                    VStack {
                        Text("\(resultMyMBTI)와 최고❤️")
                        Text("\(bestCombMbti)")
                            .font(.system(size: 50, weight: .bold, design: .rounded))
                    }
                    .padding()
                    VStack {
                        Text("\(resultMyMBTI)와 최악💔")
                        Text("\(worstCombMbti)")
                            .font(.system(size: 50, weight: .bold, design: .rounded))
                    }
                    .padding()
                }
                .multilineTextAlignment(.center)
                
                Spacer()
                
                Button {
                    currentStatus = .start
                    resetMbtiCounter()
                } label: {
                    Text("테스트 다시 하기")
                }
                .buttonStyle(.borderedProminent)
                .tint(.yellow)
                .font(.system(size: 34, weight: .black, design: .rounded))
                
                Spacer()

            }
            
        }
    }
    
    // 점수 누적
    func stackedScore(inputCase: Mbti) {
        // mbtiQuestionare.count = 12(0...11)
        guard currentQuestionIndex < mbtiQuestionare.count-1 else {
            currentQuestionIndex = 0
            currentStatus = .loading
            
            // 3초 뒤에 결과 화면으로 전환
            DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
                currentStatus = .end
            })
            
            return
        }
        
        switch inputCase {
        case Mbti.I:
            iCount += 1
        case Mbti.E:
            eCount += 1
        case Mbti.N:
            nCount += 1
        case Mbti.S:
            sCount += 1
        case Mbti.T:
            tCount += 1
        case Mbti.F:
            fCount += 1
        case Mbti.P:
            pCount += 1
        case Mbti.J:
            jCount += 1
        }
        
        currentQuestionIndex += 1
    }
    
    // 유형별 카운트 초기화
    func resetMbtiCounter() {
        iCount = 0
        eCount = 0
        nCount = 0
        sCount = 0
        tCount = 0
        fCount = 0
        pCount = 0
        jCount = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 
 [테스크]
 1. 질문과 답에 대한 O/X 정보 가져오기(survey) (O)
 
 2. 퀴즈 갯수 out of range 처리하기 (O)
    - start, goingOn, end 화면 처리해서 시작, 진행중, 결과 화면 나눔 (O)
 
 3. i, e, n, ... 등 count 변수 모아서 자신의 mbti 결과 도출하기(result) (O)
 
 4. 결과 화면에 나와 잘 맞는/잘 맞지 않는 mbti 보여주기(combination) (O)
    - 16개 유형의 모든 궁합 데이터를 가져오는 것보다 유형별 최고/최악 유형 데이터만 모을까? (O)
 
*/
