//  CreateView.swift
//  MC1-Binggrae
//
//  Created by Kim Insub on 2022/04/06.
//

import SwiftUI

struct CreateView: View {
    
    func getDate() -> String {
        let dFormatter = DateFormatter()
        dFormatter.locale = Locale(identifier: "ko_KR")
        dFormatter.dateFormat = "yyyy년 MM월 dd일"
        return dFormatter.string(from: Date())
    }
    
    @State private var isNext: Bool = false
    @State private var title: String = ""
    @State private var description: String = ""
    
    init() {
            UITextView.appearance().backgroundColor = .clear
    }

    
    var body: some View {

        NavigationView {
            
            VStack{
                
                //탭뷰
                TabView{
                                        
                    TextInputView(title: $title, description: $description, isNext: $isNext)
                    TreeListView(isNext: $isNext)
                    
                    
                }
                .tabViewStyle(.page)
                .padding(10)
                
                let groundColor = Color(red: 246 / 255, green: 246 / 255, blue: 246 / 255)

                //태우기 버튼
                Button {
                } label: {
                    Text("태우기")

                        .foregroundColor(isNext ? Color.black : Color.primary.opacity(0.25))
                        .font(.custom("NotoSansCJKkr-Medium", size: 20))
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(isNext ? .white : groundColor)
                        .clipShape(Capsule())
                        .padding(.horizontal, 10)
                }
                .disabled(!isNext)

            }
            .background(.orange)
            .navigationTitle(getDate())
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
