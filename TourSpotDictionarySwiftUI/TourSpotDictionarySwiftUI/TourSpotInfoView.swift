//
//  TourSpotInfoView.swift
//  TourSpotDictionarySwiftUI
//
//  Created by yunjikim on 2023/06/28.
//

import SwiftUI

struct TourSpotInfoView: View {
    var tourIndex: Int
    var type : travelType
    
    typealias arrays = (spots:[String], travels:[String])
    
    var arrayType: arrays {
        switch type {
        case .domestic:
            return (spots: domesticSpots, travels: domesticTravels)
        case .international:
            return (spots: interSpots, travels: interTravels)
        }
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: arrayType.spots[tourIndex])) { data in
                if let image = data.image {
                    Text("다음 여행지는 \(arrayType.travels[tourIndex])입니다!")
                    image
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
                
                Button(action: {
                    let urlStr = "https://ko.wikipedia.org/wiki/\(arrayType.travels[tourIndex])"
                    guard let url = URL(string:urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! ) else { return }
                    
                    UIApplication.shared.open(url)
                }) {
                    Text("\(arrayType.travels[tourIndex]) 더보기")
                }
                .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
            }
        }
    }
}

struct TourSpotInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TourSpotInfoView(tourIndex: 0, type: .domestic)
        }
    }
}
