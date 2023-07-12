//
//  StickerEditView.swift
//  MemoStickersSwiftUI
//
//  Created by yunjikim on 2023/07/12.
//

import SwiftUI

struct StickerEditView: View {
    var stickerStore: StickerStore
    @State var sticker: Sticker
    
    @Binding var isSwhoingEditSheet: Bool
    
    @State var selectedColor: Color = .red
    @State var memo: String = ""
    
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
    
    var body: some View {
            NavigationStack {
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
                            isSwhoingEditSheet = false
                        } label: {
                            Text("Cancel")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            sticker.color = selectedColor
                            sticker.memo = memo
                            sticker.date = Date()
                            stickerStore.updateSticker(sticker)
                            isSwhoingEditSheet = false
                        } label: {
                            Text("Sumit")
                        }
                        .disabled(memo.isEmpty)
                    }
                }
                .onAppear {
                    selectedColor = sticker.color
                    memo =  sticker.memo
                }
            }
    }
}

struct StickerEditView_Previews: PreviewProvider {
    static var previews: some View {
        StickerEditView(stickerStore: StickerStore(), sticker: Sticker(memo: "Test", color: .red, date: Date()), isSwhoingEditSheet: .constant(true))
    }
}
