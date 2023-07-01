//
//  ContentView.swift
//  AgeCalculatorSwiftUI
//
//  Created by yunjikim on 2023/06/29.
//

import SwiftUI

struct ContentView: View {
    @State var selectedDate: Date = Date() // 선택한 날짜 변수
    
    var body: some View {
        NavigationStack {
            
            Form {
                Section(header: Text("생년월일을 선택하세요.")) {
                    DatePicker("생년월일을 선택하세요.", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                }
                Section {
                    NavigationLink {
                        CalculateAgeView(selectedDate: selectedDate)
                    } label: {
                        Text("만나이 확인하기")
                    }
                }
            }
            
            .navigationTitle("만나이 계산기")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
