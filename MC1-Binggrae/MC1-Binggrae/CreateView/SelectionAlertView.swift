//
//  SelectionAlertView.swift
//  MC1-Binggrae
//
//  Created by Kim Insub on 2022/04/14.
//

import SwiftUI

struct SelectionAlertView: View {
    
    @Binding public var isShowing : Bool
    
    var body: some View {
        if isShowing {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                        .frame(height: 60)
                    
                    VStack {
                        Text("나무를 선택해주세요")
                            .font(.custom("NotoSansCJKkr-Regular", size: 20))
                            .foregroundColor(.white)
                    }.frame(width: 310, height: 77)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Divider()
                        .background(.white)
                        .frame(height: 3)
                        .offset(y:10)
                    
                    HStack {
                        Button {
                            isShowing.toggle()
                        } label: {
                            Text("돌아가기")
                                .font(.custom("NotoSansCJKkr-Regular", size: 15))
                                .frame(width: 310, height: 60)
                                .foregroundColor(.white)
                        }
                        .frame(width: 154, height: 50)
                        .offset(x:-10)
                    }.frame(width: 310, height: 60)
                }.background(Color.init(red: 20/255.0, green: 20/255.0, blue: 20/255.0))
                    .cornerRadius(6)
            }
        }
    }
}
