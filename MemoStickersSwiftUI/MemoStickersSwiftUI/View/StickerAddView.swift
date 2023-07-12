//
//  StickerAddView.swift
//  MemoStickersSwiftUI
//
//  Created by yunjikim on 2023/07/07.
//

/*
 sheet로 올라온 View에는 보통 독립적인 NavigationStack을 두는 경우가 흔하다.
 그래야 타이틀도 보이고 
 */

import SwiftUI

struct StickerAddView: View {
    var stickerStore: StickerStore
    
    @Binding var isShowingAddSheet: Bool
    
    @State var selectedColor: Color = .red
    @State var memo: String = ""
    
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
    
    var body: some View {
        NavigationStack {
            /* [Form]
             Form은 List와 다르게 나타나는 항목들이 모두 제각각 다른 형태의 겻일 때 유용하다.
             */
            VStack(alignment: .leading) {
                Section("Select a Color") {
                    HStack(spacing: 15) {
                        ForEach(colors, id: \.self) { color in
                            StickerColorSelectView(selectedColor: $selectedColor, color: color)
                        }
                    }
                }
                
                Divider()
                    .padding(.vertical, 40)
                
                Section("Write a Memo") {
                    // axis라는 옵션을 정해주면 위아래로 길어지는 메모장 가능
                    TextField("Memo...", text: $memo, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                }
                
                Spacer()
            }
            .padding(.horizontal, 16)
            
            .navigationTitle("Add a Sticker")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowingAddSheet = false
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        stickerStore.addSticker(memo: memo, color: selectedColor)
                        isShowingAddSheet = false
                    } label: {
                        Text("Sumit")
                    }
                    .disabled(memo.isEmpty)
                }
            }
        }
    }
}

struct StickerAddView_Previews: PreviewProvider {
    static var previews: some View {
        StickerAddView(stickerStore: StickerStore(), isShowingAddSheet: .constant(true))
    }
}
