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
    @Binding var isNext: Bool

    //body
    var body: some View {
        VStack(spacing: 20){
            
            //X Button
            XButtonView()

            let groundColor = Color(red: 246 / 255, green: 246 / 255, blue: 246 / 255)
            let notoBold = "NotoSansCJKkr-Bold"
            
            //Title
            ZStack(alignment: .center) {
    
                TextField("", text: $title)
                    .font(.custom(notoBold, size: 20))
                    .padding(15)
                    .multilineTextAlignment(TextAlignment.center)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(groundColor)
                    )
                    .padding(.horizontal, 20)
                
                if title.isEmpty {
                            Text("제목")
                                .font(.custom(notoBold, size: 20))
                                .foregroundColor(Color.primary.opacity(0.25))
                        }
            }

            //Description
            ZStack(alignment: .topLeading) {
                
                let placeholder: String = "장작에 태우고 싶은 것을 여기에 적으세요."

                TextEditor(text: $description)
                    .font(.custom(notoBold, size: 20))
                    .foregroundColor(Color.black)
                    .padding(.top, 30)
                    .padding(.horizontal, 20)
                    .lineSpacing(10)
                    .background(groundColor)
                    .cornerRadius(40)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)

                if description.isEmpty{
                    Text(placeholder)
                        .font(.custom(notoBold, size: 20))
                        .lineSpacing(10)
                        .foregroundColor(Color.primary.opacity(0.25))
                        .padding(.top, 38)
                        .padding(.horizontal, 45)
                }
            }
            .onAppear(){
                isNext = false
            }
        }
        .background()
        .cornerRadius(30)
        .padding(.bottom, 50)
    }
}

//struct TextInputView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        TextInputView()
//    }
//}
