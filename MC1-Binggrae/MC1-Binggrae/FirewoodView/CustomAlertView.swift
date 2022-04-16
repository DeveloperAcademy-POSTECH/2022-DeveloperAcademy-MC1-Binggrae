//
//  CustomAlertView.swift
//  MC1-Binggrae
//
//  Created by Doyun Park on 2022/04/12.
//

import SwiftUI

struct CustomAlertView: View {
    
    @Binding public var isShowing : Bool
    @Binding var isNext:Bool
    
    var body: some View {
        if isShowing {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                        .frame(height: 60)
                    
                    VStack {
                        Text("CustomAlertView.cancelQ")
                            .font(.custom("NotoSansCJKkr-Regular", size: 20))
                            .foregroundColor(.white)
                        Spacer().frame(height: 10)
                        Text("CustomAlertView.message1")
                            .font(.custom("NotoSansCJKkr-light", size: 14))
                            .foregroundColor(.init(red: 138/255.0, green: 138/255.0, blue: 138/255.0))
                        Text("CustomAlertView.message2")
                            .font(.custom("NotoSansCJKkr-light", size: 14))
                            .foregroundColor(.init(red: 138/255.0, green: 138/255.0, blue: 138/255.0))
                    }.frame(width: 310, height: 77)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Divider()
                        .background(.white)
                        .frame(height: 3)
                        .offset(y:10)
                    
                    HStack {
                        Button {
                            print("취소")
                            isShowing = false
                        } label: {
                            Text("CustomAlertView.cancelButton")
                                .font(.custom("NotoSansCJKkr-light", size: 15))
                                .foregroundColor(.white)
                                .frame(width: 154, height: 50)
                        }.frame(width: 154, height: 50)
                            .offset(x:10)
                        
                        Divider()
                            .background(Color.init(red: 37/255.0, green: 37/255.0, blue: 37/255.0))
                            .frame(width: 3, height: 52)
                        
                        Button {
                            isNext = true
                            isShowing.toggle()
                        } label: {
                            Text("CustomAlertView.confirmButton")
                                .font(.custom("NotoSansCJKkr-Regular", size: 15))
                                .foregroundColor(.white)
                                .frame(width: 154, height: 50)
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
