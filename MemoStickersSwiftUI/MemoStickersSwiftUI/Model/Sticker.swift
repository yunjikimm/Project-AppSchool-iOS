//
//  Sticker.swift
//  MemoStickersSwiftUI
//
//  Created by yunjikim on 2023/07/07.
//

import Foundation // Foundation에는 Color라는 정의가 없음
import SwiftUI

struct ColorManager {
    static let AddButtonColor = Color("AddButtonColor")
}

struct Sticker: Identifiable {
    var id: UUID = UUID()
    var memo: String
    var color: Color
    var date: Date
    
    var dateString: String {
        // [숙제] 날짜 말고 "방금, 오늘, 어제, 이번주, 이번달, ..." 포맷 만들기?!
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd EEEE HH:mm"
        
        return dateFormatter.string(from: date)
    }
}
