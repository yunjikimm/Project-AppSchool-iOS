//
//  ContentView.swift
//  TourSpotDictionarySwiftUI
//
//  Created by yunjikim on 2023/06/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(travelType.allCases, id: \.self) { option in
                NavigationLink {
                    TourSpotView(type: option)
                } label: {
                    Text("\(option.rawValue)")
                }
            }
            .navigationTitle("여행지 선택")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
