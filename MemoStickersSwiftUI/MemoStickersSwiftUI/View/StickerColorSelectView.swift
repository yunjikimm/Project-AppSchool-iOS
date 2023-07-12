//
//  StickerColorsView.swift
//  MemoStickersSwiftUI
//
//  Created by yunjikim on 2023/07/07.
//

import SwiftUI

struct StickerColorSelectView: View {
    @Binding var selectedColor: Color
    let color: Color
    
    var body: some View {
        Button {
            selectedColor = color
        } label: {
            ZStack {
                Circle()
                    .fill(color)
                    .frame(width: 40, height: 40)
                
                if selectedColor == color {
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct StickerColorsView_Previews: PreviewProvider {
    static var previews: some View {
        StickerColorSelectView(selectedColor: .constant(.yellow), color: .yellow)
    }
}
