//
//  TourSpotView.swift
//  TourSpotDictionarySwiftUI
//
//  Created by yunjikim on 2023/06/28.
//

import SwiftUI

struct TourSpotView: View {
    var type: travelType
    var travelArray: [String] {
        switch type {
        case .domestic:
            return domesticTravels
        case .international:
            return interTravels
        }
    }
    
    var body: some View {
        NavigationStack {
            List(0..<travelArray.count, id: \.self) { index in
                NavigationLink {
                    TourSpotInfoView(tourIndex: index, type: type)
                } label: {
                    Text("\(travelArray[index])")
                }

            }
            .navigationTitle("\(type.rawValue)")
        }
    }
}

struct TourSpotView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TourSpotView(type: .domestic)
        }
    }
}
