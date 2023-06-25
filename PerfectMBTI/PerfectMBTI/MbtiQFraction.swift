//
//  MbtiQFraction.swift
//  PerfactMBTI
//
//  Created by yunjikim on 2023/06/22.
//

import Foundation

enum Status {
    case start, goingOn, end, loading
}

enum Mbti: String {
   case I, E, N, S, T, F, P, J
}

struct mbtiQFraction {
    var id: UUID = UUID()
    var questionnaire: String
    var selectO: Mbti
    var selectX: Mbti
}

let mbtiQuestionare: [mbtiQFraction] = [
    mbtiQFraction(questionnaire: "전화 통화를 거는 일은 가능한 피하고 싶다.", selectO: Mbti.I, selectX: Mbti.E),
    mbtiQFraction(questionnaire: "조용하고 사적인 장소보다는 사람들로 붐비고 떠들썩한 장소를 좋아한다.", selectO: Mbti.E, selectX: Mbti.I),
    mbtiQFraction(questionnaire: "관심이 가는 사람에게 다가가서 대화를 시작하기가 어렵지 않다.", selectO: Mbti.E, selectX: Mbti.I),
    
    mbtiQFraction(questionnaire: "자유 시간 중 상당 부분을 다양한 관심사를 탐구하는 데 할애한다.", selectO: Mbti.N, selectX: Mbti.S),
    mbtiQFraction(questionnaire: "사후세계에 대한 질문이 흥미롭다고 생각한다.", selectO: Mbti.N, selectX: Mbti.S),
    mbtiQFraction(questionnaire: "자신만큼 효율적이지 못한 사람을 보면 짜증이 난다.", selectO: Mbti.N, selectX: Mbti.S),
    
    mbtiQFraction(questionnaire: "감정보다는 이성을 따르는 편이다.", selectO: Mbti.T, selectX: Mbti.F),
    mbtiQFraction(questionnaire: "다른 사람이 울고 있는 모습을 보면 자신도 울고 싶어질 때가 많다.", selectO: Mbti.F, selectX: Mbti.T),
    mbtiQFraction(questionnaire: "다른 사람의 감정을 이해하기 힘들 때가 많다.", selectO: Mbti.T, selectX: Mbti.F),
    
    mbtiQFraction(questionnaire: "일이 잘못될 때를 대비해 여러 대비책을 세우는 편이다.", selectO: Mbti.J, selectX: Mbti.P),
    mbtiQFraction(questionnaire: "일정이나 목록으로 계획을 세우는 일을 좋아한다.", selectO: Mbti.J, selectX: Mbti.P),
    mbtiQFraction(questionnaire: "하루 일정을 계획하기보다는 즉흥적으로 하고 싶은 일을 하는 것을 좋아한다.", selectO: Mbti.P, selectX: Mbti.J),
]
