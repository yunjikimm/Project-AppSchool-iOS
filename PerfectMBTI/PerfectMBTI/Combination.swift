//
//  Combination.swift
//  PerfactMBTI
//
//  Created by yunjikim on 2023/06/23.
//

import Foundation

struct Combination {
    var mbti: String
    var best: String
    var worst: String
}

let combinations: [Combination] = [
    Combination(mbti: "ENTJ", best: "ISFP", worst: "ISFJ"),
    Combination(mbti: "ENTP", best: "ISFJ", worst: "ISFP"),
    Combination(mbti: "INTJ", best: "ESFP", worst: "ESFJ"),
    Combination(mbti: "INTP", best: "ESFJ", worst: "ESFP"),
    Combination(mbti: "ESTJ", best: "INFP", worst: "INFJ"),
    Combination(mbti: "ESFJ", best: "INTP", worst: "INTJ"),
    Combination(mbti: "ISTJ", best: "ENFP", worst: "ENFJ"),
    Combination(mbti: "ISFJ", best: "ENTP", worst: "ENTJ"),
    Combination(mbti: "ENFJ", best: "ISTP", worst: "ISTJ"),
    Combination(mbti: "ENFP", best: "ISTJ", worst: "ISTP"),
    Combination(mbti: "INFJ", best: "ESTP", worst: "ESTJ"),
    Combination(mbti: "INFP", best: "ESTJ", worst: "ESTP"),
    Combination(mbti: "ESTP", best: "INFJ", worst: "INFP"),
    Combination(mbti: "ESFP", best: "INTJ", worst: "INTP"),
    Combination(mbti: "ISTP", best: "ENFJ", worst: "ENFP"),
    Combination(mbti: "ISFP", best: "ENTJ", worst: "ENTP"),
]
