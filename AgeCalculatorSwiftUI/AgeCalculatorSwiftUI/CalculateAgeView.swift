//
//  CalculateAgeView.swift
//  AgeCalculatorSwiftUI
//
//  Created by yunjikim on 2023/06/29.
//

import SwiftUI


/*
 1. 생일 지났는지 날짜 비교
    - 월일만 가지고 비교?
 
 2. 연도 비교
 */

// 생일 지났는지 안 지났는지 여부
enum PassedBirthDay {
    case passed, notYetPassed
}

struct CalculateAgeView: View {
    var selectedDate: Date // 생년월일
    let today: Date = Date() // 오늘
    
    let format = DateFormatter()
    
    var birthDate: String {
        format.dateFormat = "yyyy-MM-dd"
        return format.string(from: selectedDate)
    }
    var currentDate: String {
        format.dateFormat = "yyyy-MM-dd"
        return format.string(from: today)
    }
    
    // 만 나이
    var currentAgeString: String {
        var result = ""
        
        format.dateFormat = "MM-dd"
        let birthMonthDay = format.string(from: selectedDate)
        let currentMonthDay = format.string(from: today)
        
        // 1. "MM-dd" 포맷으로 생일 지났는지 비교
        switch currentMonthDay.compare(birthMonthDay) {
        case .orderedSame, .orderedDescending:
            // 2. calculatedAge(): "yyyy" 포맷으로 연도 비교하는 함수
            result = "\(calculatedAge(isPassed: PassedBirthDay.passed))"
        case .orderedAscending:
            result = "\(calculatedAge(isPassed: PassedBirthDay.notYetPassed))"
        }
        
        return result
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("만")
                Text(currentAgeString)
                Text("세")
            }
            .font(.system(size: 50))
            .fontWeight(.heavy)
            
            HStack(spacing: 50) {
                VStack(spacing: 10) {
                    Text("생년월일")
                    Text("\(birthDate)")
                }
                VStack(spacing: 10) {
                    Text("오늘")
                    Text("\(currentDate)")
                }
            }
            .padding()
        }
    }
    
    // 2. calculatedAge(): "yyyy" 포맷으로 연도 비교하는 함수
    func calculatedAge(isPassed: PassedBirthDay) -> Int {
        var result: Int = 0
        
        format.dateFormat = "yyyy"
        let birthYear = format.string(from: selectedDate)
        let currentYear = format.string(from: today)
        
        guard let birthYearInt = Int(birthYear),
              let currentYearInt = Int(currentYear) else {
            return 0
        }
        
        switch isPassed {
        case .passed:
            result = currentYearInt - birthYearInt
        case .notYetPassed:
            result = currentYearInt - birthYearInt - 1
        }
    
        return result
    }
}

struct CalculateAgeView_Previews: PreviewProvider {
    static var previews: some View {
        CalculateAgeView(selectedDate: Date())
    }
}
