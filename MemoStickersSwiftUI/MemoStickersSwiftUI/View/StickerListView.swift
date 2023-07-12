//
//  StickerListView.swift
//  MemoStickersSwiftUI
//
//  Created by yunjikim on 2023/07/07.
//

import SwiftUI

struct StickerListView: View {
    /*
     [@StateObject와 @ObservedObject]
     - @StateObject와 @ObservedObject 모두 Observable 프로토콜을 따르는 클래스를 관찰해서 body를 변경한다.
     - @StateObject와 @ObservedObject는 슈퍼뷰와 서브뷰 사이에서 늘 새롭게 만들어지느냐, 아니면 상태를 유지하냐에서 동작 방식 차이가 있다.
     */
    
    @ObservedObject var stickerStore: StickerStore = StickerStore()
    @State var sticker: Sticker = Sticker(memo: "temp", color: .red, date: Date())
    
    @State var isShowingAddSheet: Bool = false
    @State var isSwhoingEditSheet: Bool = false
    
    var body: some View {
        VStack {
            if stickerStore.stickers.count > 0 {
                List(stickerStore.stickers) { sticker in
                    Button {
                        self.sticker = sticker
                        isSwhoingEditSheet = true
                    } label: {
                        StickerView(stickerStore: stickerStore, sticker: sticker)
                    }
                }
            } else {
                Spacer()
                Text("메모가 없습니다.")
                    .padding(.top, -50)
                Spacer()
            }
        }
        .listStyle(.plain)
        .navigationTitle("Stickers")
        .overlay(alignment: .bottom) {
            Button {
                isShowingAddSheet = true
            } label: {
                Label {
                    Text("Add")
                        .font(.callout)
                        .fontWeight(.semibold)
                } icon: {
                    Image(systemName: "plus.app.fill")
                }
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 25)
                .background(ColorManager.AddButtonColor, in: Capsule())
            }
        }
        .sheet(isPresented: $isShowingAddSheet) {
            StickerAddView(stickerStore: stickerStore, isShowingAddSheet: $isShowingAddSheet)
        }
        .sheet(isPresented: $isSwhoingEditSheet) {
            StickerEditView(stickerStore: stickerStore, sticker: sticker, isSwhoingEditSheet: $isSwhoingEditSheet)
        }
    }
}

struct StickerListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StickerListView()
        }
    }
}
