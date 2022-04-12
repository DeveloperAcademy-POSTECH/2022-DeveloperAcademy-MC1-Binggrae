//
//  introView.swift
//  jerry-test
//
//  Created by LeeJaehoon on 2022/04/12.
//

import SwiftUI

struct IntroView: View {
    
    // 풀스크린커버 페이지 전환
    @Environment(\.presentationMode) var presentationMode
    
    
    @State private var isAppear1 = true
    @State private var isAppear2 = false
    @State private var isAppear3 = false
    @State private var isAppear4 = false
    //    @State private var isAppear5 = false
    @State private var isPresented = false
    
    @State private var fadeInOut = false
    
//    init(){
//        self.isAppear1 = true
//    }
    
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Image("logo_png")
                Spacer()
                Text("MUNG는 이어폰 사용을 권장합니다.")
                    .tracking(-0.54)
                    .padding()
                    .font(.system(size: 14).weight(.ultraLight))
            }
            .opacity(isAppear1 ? 1 : 0)
            .animation(.easeInOut(duration: 1))
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isAppear1.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isAppear2.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isAppear3.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    isAppear4.toggle()
                }
                //                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                //                        isAppear5.toggle()
                
            }
            
            
            VStack{
                Spacer()
                
                
                Group {
                    HStack {
                        Text("오늘 하루,")
                            .tracking(-2.4)
                            .opacity(isAppear2 ? 1 : 0)
                            .animation(.easeIn(duration: 0.8))
                            .font(.system(size: 60).weight(.ultraLight))
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("쉬어가는")
                            .tracking(-2.4)
                            .opacity(isAppear3 ? 1 : 0)
                            .animation(.easeIn(duration: 0.8))
                            .font(.system(size: 60).weight(.ultraLight))
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("그 순간")
                            .tracking(-2.4)
                            .opacity(isAppear3 ? 1 : 0)
                            .animation(.easeIn(duration: 0.8))
                            .font(.system(size: 60).weight(.ultraLight))
                        
                        Spacer()
                    }
                }.padding([.leading], 30)
                
                Spacer()
                
                HStack {
                    Spacer()
                    //버튼
                    Text("시작하기")
                        .opacity(isAppear4 ? 1 : 0)
                        .animation(.easeIn(duration: 0.8))
                        .font(.system(size: 14).weight(.ultraLight))
                    Image("arrow")
                        .opacity(isAppear4 ? 1 : 0)
                        .animation(.easeIn(duration: 0.8))
                    
                }.padding([.leading, .trailing], 20)
                    .onTapGesture {
                        isPresented.toggle()
                    }.fullScreenCover(isPresented: $isPresented, content: CreateView.init)
                    .onAppear(){
                        withAnimation(Animation.easeInOut(duration: 0.9).repeatForever(autoreverses: true)){
                            fadeInOut.toggle()
                        }
                    }.opacity(fadeInOut ? 0.1 : 1)
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
