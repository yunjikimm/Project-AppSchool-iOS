//
//  MemoStickersSwiftUIApp.swift
//  MemoStickersSwiftUI
//
//  Created by yunjikim on 2023/07/07.
//

import SwiftUI

/*
 SwiftUI에서 App은 Scene이라는 장면을 가지고 화면을 나타낸다.
 Scene에서는 WindowGroup을 갖고 그 안에 여러 개의 View들을 담을 수 있다.
 (단, iOS는 보통 하나의 View로 제약)
 */

@main
struct MemoStickersSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
