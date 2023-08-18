//
//  ContentView.swift
//  LoginDemowithFirebase
//
//  Created by yunjikim on 2023/08/09.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var authViewModel: AuthenticationViewModel = AuthenticationViewModel()
    
    @State var isShowingLoginSheet: Bool = false
    
    var isSignedInWithGoogle: Bool {
        authViewModel.isSignedInWithGoogle
    }
    
    var loginStatus: String {
        if isSignedInWithGoogle {
            return "로그인 됨"
        } else {
            return "로그인 안 됨"
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("\(loginStatus)")
            
            Spacer()
            
            if isSignedInWithGoogle {
                Button {
                    authViewModel.signOut()
                    authViewModel.isSignedInWithGoogle = false
                } label: {
                    Text("로그아웃")
                        .padding(.vertical, 5)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .padding()
            } else {
                Button {
                    isShowingLoginSheet.toggle()
                } label: {
                    Text("로그인")
                        .padding(.vertical, 5)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
        .sheet(isPresented: $isShowingLoginSheet) {
            LoginView(authViewModel: authViewModel, isShowingLoginSheet: $isShowingLoginSheet)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
