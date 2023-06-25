//
//  TeamMate.swift
//  TeamUI
//
//  Created by yunjikim on 2023/06/14.
//

import Foundation

/* List에서 Student의 배열이 활용되려면 Identifiable 프로토콜을 따라야 한다.
   Identifiable 프로토콜은 개별적으로 구분되어 겹치지 않는 값으로 id라는 프로퍼티들을 강제로 요구한다. */
struct TeamMate: Identifiable {
    var id: UUID = UUID() // UUID는 시스템이 알아서 고유의 아이디를 생성해준다.
    var number: Int
    var name: String
    var nickName: String
    var image: String
}

/* TeamMate(number: , name: ) 구조체를 불러다가 데이터를 삽입할 경우 자동으로 init이 생긴다.
   teamMates라는 이름의 인스턴스는 이 프로젝트 어느 코드에서도 호출해서 쓸 수 있는 전역 상수가 된다. */
let teamMates: [TeamMate] = [
    TeamMate(number: 201, name: "김윤지", nickName: "윤딩", image: "bee"),
    TeamMate(number: 202, name: "김종찬", nickName: "DJ", image: "cat"),
    TeamMate(number: 204, name: "박범수", nickName: "박뺌", image: "cow"),
    TeamMate(number: 205, name: "손윤호", nickName: "유노", image: "dog"),
    TeamMate(number: 206, name: "유재희", nickName: "유잭구", image: "fox"),
    TeamMate(number: 207, name: "이희찬", nickName: "차니", image: "monkey"),
    TeamMate(number: 301, name: "윤진영", nickName: "오렌즤", image: "pig"),
]
