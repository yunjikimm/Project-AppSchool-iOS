//
//  TourPhotoStore.swift
//  TourPhotoGallery
//
//  Created by yunjikim on 2023/08/08.
//

import Foundation

class TourPhotoStore: ObservableObject {
    @Published var photos: [Item] = []
    @Published var fetchMessage: String = ""
    
    func fetchData() async {
        
        let urlString: String = "https://apis.data.go.kr/B551011/PhotoGalleryService1/galleryList1?serviceKey=j66lVGKJrUfUXfTGAIdEESPM2%2FviFrm1Pd62xVzBOBlZ7oGvTIrhtxFRZSwfpMBKRamkHZY%2BNUx%2FjuXdEbd%2FqA%3D%3D&numOfRows=10&pageNo=1&MobileOS=IOS&MobileApp=aa&arrange=A&_type=json"
        
        guard let url = URL(string: urlString) else {
            print("Wrong URL")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            print("\(response)")

            let jsonString = String(data: data, encoding: .utf8)
            print("\(jsonString ?? "")")

            let tourPhotoGallery = try JSONDecoder().decode(TourPhotoGallery.self, from: data)

            DispatchQueue.main.async {
                self.photos = tourPhotoGallery.response.body.items.item
                self.fetchMessage = ""
            }
            
//            print(photos)

        } catch {
            debugPrint("--------")
            debugPrint("Error loading \(url):")
            debugPrint("\(String(describing: error))")
            debugPrint("--------")

            DispatchQueue.main.async {
                self.fetchMessage = "정보 읽기 실패했습니다"
            }
        }
    }
}
