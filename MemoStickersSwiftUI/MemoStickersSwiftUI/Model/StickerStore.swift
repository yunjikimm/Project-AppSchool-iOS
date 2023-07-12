//
//  StickerStore.swift
//  MemoStickersSwiftUI
//
//  Created by yunjikim on 2023/07/07.
//

import Foundation
import SwiftUI

class StickerStore: ObservableObject {
    @Published var stickers: [Sticker] = []
    
//    init() {
//        stickers = [
//            Sticker(memo: "Hello", color: .blue, date: Date()),
//            Sticker(memo: "World", color: .yellow, date: Date()),
//            Sticker(memo: "Good Moring", color: .green, date: Date()),
//        ]
//    }
    
    func addSticker(memo: String, color: Color) {
        if memo.count > 0 {
            let sticker: Sticker = Sticker(memo: memo, color: color, date: Date())
            stickers.insert(sticker, at: 0)
        }
    }
    
    func updateSticker(_ sticker: Sticker) {
        var index: Int = 0
        
        for temp in stickers {
            if temp.id == sticker.id {
                stickers.remove(at: index)
                stickers.insert(sticker, at: 0)
                break
            }
            index += 1
        }
    }
    
    func removeSticker(_ sticker: Sticker) {
        var index: Int = 0
        
        for temp in stickers {
            if temp.id == sticker.id {
                stickers.remove(at: index)
                break
            }
            index += 1
        }
    }
}
