//
//  endView.swift
//  jerry-test
//
//  Created by LeeJaehoon on 2022/04/12.
//

import SwiftUI

struct OutroView: View {
    
    // 풀스크린커버 페이지 전환
    @Environment(\.presentationMode) var presentationMode
    
    
    @State private var isPresented = false
    
    @State private var isAppear1 = false
    @State private var isAppear2 = false
    @State private var isAppear3 = false
    
    
    
    var body: some View {
        
        VStack {
            Spacer()
            
            
            Group {
                HStack {
                    Text("널 힘들게 했던\n모든 것들이 ")
                        .tracking(-2)
                        .opacity(isAppear1 ? 1 : 0)
                        .animation(.easeIn(duration: 1))
                        .font(.system(size: 50).weight(.ultraLight))
                        .onAppear(){
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                isAppear1.toggle()
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                isAppear2.toggle()
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                isAppear3.toggle()
                            }
                            
                        }
                    Spacer()
                }.padding([.bottom])
                
                HStack {
                    Text("다 탔어.")
                        .tracking(-2)
                        .opacity(isAppear2 ? 1 : 0)
                        .animation(.easeIn(duration: 1))
                        .font(.system(size: 50).weight(.regular))
                    Spacer()
                    
                }
            }.padding([.leading], 30)
            
            Spacer()
            
            Text("종료하기")
                .opacity(isAppear3 ? 1 : 0)
                .animation(.easeIn(duration: 1))
                .font(.system(size: 18).weight(.bold))
                .onTapGesture {
                    isPresented.toggle()
                }.fullScreenCover(isPresented: $isPresented, content: IntroView.init)
            
        }
        
    }
}

struct endView_Previews: PreviewProvider {
    static var previews: some View {
        OutroView()
    }
}
