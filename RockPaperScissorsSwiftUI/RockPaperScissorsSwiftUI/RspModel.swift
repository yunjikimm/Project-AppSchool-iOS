//
//  RspModel.swift
//  RockPaperScissorsSwiftUI
//
//  Created by yunjikim on 2023/06/28.
//

import Foundation
import SwiftUI

enum RSP: Int {
    case scissors = 0
    case rock = 1
    case paper = 2
}

extension Color {
    static let lightyellow = Color.init(CGColor(red: 246/255, green: 254/255, blue: 182/255, alpha: 1))
}
