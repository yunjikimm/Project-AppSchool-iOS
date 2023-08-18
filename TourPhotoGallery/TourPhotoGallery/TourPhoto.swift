// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct TourPhotoGallery: Codable {
    let response: Response
}

struct Response: Codable {
    let header: Header
    let body: Body
}

struct Body: Codable {
    let items: Items
    let numOfRows, pageNo, totalCount: Int
}

struct Items: Codable {
    let item: [Item]
}

struct Item: Codable {
    let galContentID, galContentTypeID, galTitle: String
    let galWebImageURL: String
    let galCreatedtime, galModifiedtime, galPhotographyMonth, galPhotographyLocation: String
    let galPhotographer: GalPhotographer
    let galSearchKeyword: String

    enum CodingKeys: String, CodingKey {
        case galContentID = "galContentId"
        case galContentTypeID = "galContentTypeId"
        case galTitle
        case galWebImageURL = "galWebImageUrl"
        case galCreatedtime, galModifiedtime, galPhotographyMonth, galPhotographyLocation, galPhotographer, galSearchKeyword
    }
}

enum GalPhotographer: String, Codable {
    case 한국관광공사송재근 = "한국관광공사 송재근"
    case 한국관광공사이범수 = "한국관광공사 이범수"
}

struct Header: Codable {
    let resultCode, resultMsg: String
}
