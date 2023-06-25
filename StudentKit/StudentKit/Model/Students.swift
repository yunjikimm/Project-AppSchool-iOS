//
//  Students.swift
//  StudentKit
//
//  Created by yunjikim on 2023/06/14.
//

import Foundation

struct Student {
    var number: Int
    var name: String
}

// 하드코딩: 직접 데이터를 심어버리는 코딩

// Student(number: , name: ) 구조체를 불러다가 데이터를 삽입할 경우 자동으로 init이 생긴다.
// students라는 이름의 인스턴스는 이 프로젝트 어느 코드에서도 호출해서 쓸 수 있는 전역 상수가 된다. 
let students: [Student] = [
    Student(number: 201, name: "김윤지"),
    Student(number: 202, name: "최소정"),
    Student(number: 203, name: "송원준"),
    Student(number: 204, name: "한현민"),
    Student(number: 205, name: "봉주헌"),
    Student(number: 206, name: "송성욱"),
    Student(number: 207, name: "김상규"),
    Student(number: 301, name: "한채린"),
    Student(number: 302, name: "나예슬"),
    Student(number: 303, name: "이승준_1"),
    Student(number: 304, name: "김종찬"),
    Student(number: 305, name: "임하니"),
    Student(number: 306, name: "주진형"),
    Student(number: 307, name: "남형식"),
]
