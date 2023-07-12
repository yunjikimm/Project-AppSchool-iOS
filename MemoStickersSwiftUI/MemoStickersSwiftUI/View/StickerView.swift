//
//  StickerView.swift
//  MemoStickersSwiftUI
//
//  Created by yunjikim on 2023/07/07.
//

import SwiftUI

struct StickerView: View {
    var stickerStore: StickerStore
    let sticker: Sticker
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(sticker.memo)")
                    .font(.title2)
                    .fontWeight(.bold)
                
                HStack(alignment: .center) {
                    Image(systemName: "calendar")
                    Text("\(sticker.dateString)")
                        .font(.footnote)
                        .padding(.top, 5)
                }
            }
            .foregroundColor(.black)
            
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(content: {
            ZStack {
                Rectangle()
                    .fill(sticker.color)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        })
        .contextMenu {
            /* [contextMenu]
             - 해당 객체를 꾹 눌렀을 때 나오는 메뉴
             */
            
            // 공유
            ShareLink(item: sticker.memo)
            
            // 삭제
            Button {
                stickerStore.removeSticker(sticker)
            } label: {
                Image(systemName: "trash.slash")
                Text("Delete")
            }

        }
    }
}

struct StickerView_Previews: PreviewProvider {
    static var previews: some View {
        StickerView(stickerStore: StickerStore(), sticker: Sticker(memo: "Memo", color: .yellow, date: Date()))
    }
}
