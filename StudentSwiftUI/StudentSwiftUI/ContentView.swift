//
//  ContentView.swift
//  TeamUI
//
//  Created by yunjikim on 2023/06/14.
//

import SwiftUI
import AVFoundation

let speechSynth = AVSpeechSynthesizer()

struct ContentView: View {
    @State var message: String = "Select your TeamMate"
        
        var body: some View {
            VStack {
                Text("\(message)")
                
                /* students의 내용들을 하나씩 꺼내서 그 이름을 student라고 하고
                   이를 활용해서 각 줄을 구성하는 목록을 만든다. (클로저) */
                List(teamMates) { TeamMate in
                    Button {
                        message = "Hello \(TeamMate.name) it's your nickname \(TeamMate.nickName)"
                        sayHi(message)
                    } label: {
                        HStack {
                            Image(TeamMate.image)
                                .resizable()
                                .frame(width: 50, height: 50)
                            Spacer()
                            Text("\(TeamMate.name)")
                            Text("\(TeamMate.number)")

                        }
                    }
                }
            }
            .listStyle(.plain)
        }
}

func sayHi(_ messages: String) {
    let utterance = AVSpeechUtterance(string: messages)
    utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
    speechSynth.speak(utterance)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
