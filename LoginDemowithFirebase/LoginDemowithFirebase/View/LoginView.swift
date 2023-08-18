//
//  ContentView.swift
//  LoginDemowithFirebase
//
//  Created by yunjikim on 2023/08/09.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct LoginView: View {
    var authViewModel: AuthenticationViewModel
    
    @State var email: String = ""
    @State var password: String = ""
    @Binding var isShowingLoginSheet: Bool
    
    var body: some View {
        NavigationStack{
            VStack {
                VStack(alignment: .leading) {
                    Text("이메일")
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.top)
                
                VStack(alignment: .leading) {
                    Text("비밀번호")
                    TextField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.vertical)
                
                Button {
                    
                } label: {
                    Text("로그인")
                        .padding(.vertical, 5)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                
                Divider()
                    .padding(.vertical)
                
                GoogleSignInButton {
                    Task {
                        await authViewModel.signInWithGoogle()
                        isShowingLoginSheet = false
                        authViewModel.isSignedInWithGoogle = true
                    }
                }
                
                HStack {
                    Text("회원이 아니신가요?")
                    Button {
                        
                    } label: {
                        Text("가입하기")
                    }
                }
                .padding(.top, 60)
            }
            .padding(.horizontal)
            
            .navigationTitle("로그인")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authViewModel: AuthenticationViewModel(), isShowingLoginSheet: .constant(true))
    }
}
