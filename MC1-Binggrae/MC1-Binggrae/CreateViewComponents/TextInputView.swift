//
//  TextInputView.swift
//  MC1-Binggrae
//
//  Created by Kim Insub on 2022/04/07.
//

import SwiftUI

struct TextInputView: View {
    
    //Define
    @Binding var title: String
    @Binding var description: String
    let notoLight = "NotoSansCJKkr-Light"
    let notoRegular = "NotoSansCJKkr-Regular"
    let placeholderFontColor = Color(red: 107 / 255, green: 107 / 255, blue: 107 / 255)
    let roundColor = Color(red: 58 / 255, green: 58 / 255, blue: 58 / 255)
    let backgroundColor = Color(red: 27 / 255, green: 27 / 255, blue: 27 / 255)
    @FocusState private var isFocused: Bool

    
    //body
    var body: some View {
        VStack{
            
            //Title
            Group{
                Text("제목")
                    .font(.custom(notoRegular, size: 12))
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .foregroundColor(.white)
                    .padding(.top,60)

                ZStack {
                    if title.isEmpty{
                        Text("뭘 잊고 싶으신가요?")
                            .font(.custom(notoLight, size: 34))
                            .foregroundColor(placeholderFontColor)
                            .offset(x: -5, y:-15)
                    }
                    TextField("", text: $title)
                        .font(.custom(notoLight, size: 34))
                        .foregroundColor(.white)
                        .padding(.bottom, 30)
                        .focused($isFocused)
                }
            }
            .padding(.horizontal, 20)
        
            //Description
            Group{
                Text("내용")
                    .font(.custom(notoRegular, size: 12))
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .foregroundColor(.white)
                
                ZStack{
                    if description.isEmpty{
                        Text("무슨 일이 있었나요?")
                            .font(.custom(notoLight, size: 34))
                            .foregroundColor(placeholderFontColor)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .offset(y: -115)
                    }
                    TextEditor(text: $description)
                        .font(.custom(notoLight, size: 34))
                        .foregroundColor(.white)
                        .offset(x: -5)
                        .focused($isFocused)
                }
                .offset(y:-10)
                .frame(maxWidth: .infinity,alignment: .leading)
            }
            .padding(.horizontal, 20)
        }
        .background(isFocused ? backgroundColor : Color.black)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(roundColor)
        )
        .frame(width: 330,height: 509)
    }
}

//struct TextInputView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        TextInputView()
//    }
//}
