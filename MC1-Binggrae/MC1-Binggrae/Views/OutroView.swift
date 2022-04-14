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
    
    let notoRegular = "NotoSansCJKkr-Regular"

    var body: some View {
        
        VStack {
            Spacer()
            
            
            Group {
                HStack {
                    Text("널 힘들게 했던\n모든 것들이 ")
                        .tracking(-2)
                        .opacity(isAppear1 ? 1 : 0)
                        .animation(.easeIn(duration: 1), value: isAppear1)
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
                        .animation(.easeIn(duration: 1), value: isAppear2)
                        .font(.system(size: 50).weight(.regular))
                    Spacer()
                    
                }
            }.padding([.leading], 30)
            
            Spacer()
            
            //종료하기 Button
            Button {
                isPresented.toggle()
            } label: {
                Text("종료하기")
                    .foregroundColor(.white)
                    .tracking(-0.5)
                    .font(.custom(notoRegular, size: 18))
                    .frame(width: 200, height: 70)
                    
            }.opacity(isAppear3 ? 1 : 0)
                .padding([.bottom], 10.0)
                .fullScreenCover(isPresented: $isPresented, content: IntroView.init)
        }
        
    }
}

struct endView_Previews: PreviewProvider {
    static var previews: some View {
        OutroView()
            .preferredColorScheme(.dark)
    }
}
