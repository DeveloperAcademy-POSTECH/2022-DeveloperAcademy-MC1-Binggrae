//  CreateView.swift
//  MC1-Binggrae
//
//  Created by Kim Insub on 2022/04/06.
//

import SwiftUI

struct CreateView: View {
    
    //NavTitle
    func getDate() -> String {
        let dFormatter = DateFormatter()
        dFormatter.locale = Locale(identifier: "ko_KR")
        dFormatter.dateFormat = "yyyy년 MM월 dd일"
        return dFormatter.string(from: Date())
    }
    
    //Define
    @State private var isNext: Bool = false
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var selectedTree: Tree?
    
    //init
    init() {
            UITextView.appearance().backgroundColor = .clear
    }

    //body
    var body: some View {
        
        let lightGray = Color(red: 246 / 255, green: 246 / 255, blue: 246 / 255)

        NavigationView {
            
            VStack{
                
                //TabView
                TabView{
                                       
                    //FirstPage
                    TextInputView(
                        title: $title,
                        description: $description,
                        isNext: $isNext
                    )
                    
                    //SecondPage
                    TreeListView(
                        title: $title,
                        description: $description,
                        isNext: $isNext,
                        selectedTree: $selectedTree
                    )
                }
                .tabViewStyle(.page)
                .padding(10)
                

                //태우기 Button
                Button {
                    
                    let tree: Tree? = selectedTree
                    let data = Firewood(title: title, description: description, tree: tree)
                    
                    print(data)
                } label: {
                    Text("태우기")
                        .foregroundColor(isNext ? Color.black : Color.primary.opacity(0.25))
                        .font(.custom("NotoSansCJKkr-Medium", size: 20))
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(isNext ? .white : lightGray)
                        .clipShape(Capsule())
                        .padding(.horizontal, 10)
                }
                .disabled(!isNext)

            }
            .background(.black)
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
