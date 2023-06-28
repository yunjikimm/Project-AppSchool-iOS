//
//  TourSpotData.swift
//  TourSpotDictionarySwiftUI
//
//  Created by yunjikim on 2023/06/28.
//

import Foundation

enum travelType: String, CaseIterable {
    case domestic = "국내 여행지", international = "해외 여행지"
}

var domesticTravels: [String] = ["부산", "속초", "양양", "제주", "여수", "거제", "강릉", "춘천", "독도", "전주", "울릉도", "대구", "포항", "목포", "해남", "태안", "강화도", "인천", "서울", "가평", "안산"]

var domesticSpots: [String] = [
    "https://t1.daumcdn.net/cfile/tistory/99EEBD355E554EA121",
    "https://static.hanatour.com/product/2021/10/15/0816438u6p/default.jpg",
    "https://img.seoul.co.kr/img/upload/2020/07/29/SSI_20200729224339_O2.jpg",
    "https://blog.kakaocdn.net/dn/o1KIw/btqu9mflPY6/rGk1mM3iugV1c6jj9Z3E80/img.jpg",
    "https://a.cdn-hotels.com/gdcs/production102/d390/e4e76e16-ba3e-4ce6-8f97-d78d840bbc50.jpg",
    "https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=49e0abeb-0275-4230-84b8-482f6c0d5029",
    "https://a.travel-assets.com/findyours-php/viewfinder/images/res70/247000/247578-Gangwon.jpg",
    "https://dimg.donga.com/wps/NEWS/IMAGE/2021/01/16/104946256.1.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5Hbu4bR3gLdoPP5wq9CFF5kjLNODZ6NueHQ&usqp=CAU",
    "https://upload.wikimedia.org/wikipedia/commons/f/f2/%EC%A0%84%EC%A3%BC%ED%95%9C%EC%98%A5%EB%A7%88%EC%9D%84_%EC%A0%84%EA%B2%BD.JPG",
    "https://m.segye.com/content/image/2021/06/16/20210616515482.jpg",
    "https://a.cdn-hotels.com/gdcs/production196/d858/31e5db31-d4fb-4a22-96be-bfe5158903a3.jpg?impolicy=fcrop&w=800&h=533&q=medium",
    "https://cdn.travie.com/news/photo/201903/20822_3401_022.jpg",
    "https://blog.kakaocdn.net/dn/bC7cC6/btrEeXclKhw/zAqjmjoxxurAHAZVOQ6eoK/img.jpg",
    "https://www.brainmedia.co.kr/Library/FileDown.aspx?filename=20141220171936591625.jpg&filepath=",
    "https://www.ganghwa.go.kr/images/tour/images/full/9_chojijin_jeongyeong.jpg",
    "https://www.ganghwa.go.kr/images/tour/images/full/9_chojijin_jeongyeong.jpg",
    "https://a.cdn-hotels.com/gdcs/production181/d952/77e61a1a-d4ef-4f09-b657-ff490a477dff.jpg",
    "https://love.seoul.go.kr/Pds/Board/seoul_news_write/Editor/article_202108_05.jpg",
    "https://cdn.kbmaeil.com/news/photo/202002/837620_855355_340.jpg",
    "https://www.ecomedia.co.kr/news/data/20170918/p1065573618286731_216_thum.JPG"
]

var interTravels: [String] = ["런던", "코타키나발루", "하와이", "삿포로", "베트남", "프랑스", "베니스", "뉴욕", "알레스카", "스위스", "블라디보스톡", "스페인", "바르셀로나", "필리핀", "이탈리아", "몰디브"]

var interSpots: [String] = [
    "https://res.klook.com/image/upload/Mobile/City/n9sn4fajwa1skldmdeex.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwXOKg3uLsQnZFapJqtVexAOBvh6jMPUx5Yg&usqp=CAU",
    "https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/e91155d0-d117-46d8-9610-7356c990618d.jpeg",
    "https://a.cdn-hotels.com/gdcs/production135/d521/bba19247-6149-43cf-8357-4ca651715730.jpg",
    "https://www.seoulfn.com/news/photo/202204/452020_219794_1555.jpg",
    "https://youimg1.tripcdn.com/target/0103e120004eucn60F583_C_640_320_R5_Q70.jpg_.webp?proc=source%2Ftrip",
    "https://kr.img.news.koreanair.com/wp-content/uploads/2019/09/NR201909_traffic_NCE_3.png",
    "https://i.namu.wiki/i/mhrfwdvG183XHW_hF7maCS8UR3SeX8PZ8kpNBzbFhGEKrq9KrrF8Ehi1S3E-UeZh8ow23miBm9-jDC-3uOf4Og.webp",
    "https://www.gousa.or.kr/sites/default/files/styles/state_hero_l/public/images/hero_media_image/2023-05/0d851f7d-2da0-46af-93f6-4fd06781511a_0.jpeg?h=e770e010&itok=CELGhf0T",
    "https://www.travelnbike.com/news/photo/201805/57815_85365_4941.jpg",
    "https://d3b39vpyptsv01.cloudfront.net/photo/1/2/fd09bcaa448ce88c9b8de207b3afec96.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOlHk5W8j-mA-nALkwp91XqM1mThDMWSuckQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTGXbnQQ0l0oHPft07kpy9ZB1b97Rx_BkxaQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0QkfaYEgITiTlEAl_c9QGcoPSksHmo4oA8g&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVA-kadWy5jd3kUIEeX3uAdvtbAduutuLx6w&usqp=CAU",
    "https://img.hankyung.com/photo/202105/01.26399989.1.jpg"
]
