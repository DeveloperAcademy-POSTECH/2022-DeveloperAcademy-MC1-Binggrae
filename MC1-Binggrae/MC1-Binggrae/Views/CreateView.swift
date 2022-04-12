//  CreateView.swift
//  MC1-Binggrae
//
//  Created by Kim Insub on 2022/04/06.
//

import SwiftUI

struct CreateView: View {
    
    //Define
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var selectedTree: Tree?
    @State private var data: Firewood?
    @State private var isPresenting: Bool = false
    @State private var firewoodData: Firewood?
    @State var currentPageIndex: CGFloat = 2
    
    let notoThin = "NotoSansCJKkr-Thin"
    let notoLight = "NotoSansCJKkr-Light"
    let notoRegular = "NotoSansCJKkr-Regular"
    let notoMedium = "NotoSansCJKkr-Medium"

    let buttonFontColor = Color(red: 63 / 255, green: 63 / 255, blue: 63 / 255)

    //init
    init() {
            UITextView.appearance().backgroundColor = .clear
    }

    //body
    var body: some View {
        
        ScrollView{
            VStack{
                
                //1 장작을 선택하세요
                HStack{
                    let one = Text("1").font(.custom(notoThin, size: 54))

                    Text("\(one)  장작을 선택하세요")
                        .font(.custom(notoLight, size: 18))
                    Spacer()
                }
                .padding(.top,140)

                
                //Tree Cards
                TabView{
                    ForEach(trees, id:\.self){

                        tree in

                        Button{
                            selectedTree = tree
                        } label: {
                            
                            let isSelected: Bool = selectedTree?.name == tree.name
                            
                            let imageName: String = isSelected ? "\(tree.name)_deactive" : "\(tree.name)_active"
                            
                            Image(imageName)
                                .resizable()
                                .frame(width: 310, height: 359)
                        }
                        
                    }
                    .padding(.bottom, 64)
                    
                }
                .frame(width: 310, height: 423)
                .tabViewStyle(.page)
            
                //2 장작과 함께 태울 것을 적어보세요
                HStack{
                    let two = Text("2").font(.custom(notoThin, size: 54))

                    Text("\(two)  장작과 함께 태울 것을 적어보세요")
                        .font(.custom(notoLight, size: 18))
                    Spacer()
                }
                
                //Text Inputs
                TextInputView(title: $title, description: $description)
                
                //태우기 Button
                Button {
                    let tree: Tree? = selectedTree
                    firewoodData = Firewood(title: title, description: description, tree: tree)
                    isPresenting.toggle()
                    
                } label: {

                    Text("태우기")
                        .foregroundColor(Color.white)
                        .font(.custom(notoMedium, size: 18))
                        .kerning(5)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 10)
                        
                }
                .fullScreenCover(isPresented: $isPresenting, content: {
//                FirewoodView(firewoodData: $firewoodData)
                })
                .padding(.top, 30)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 30)
        }

            
    }
    
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        //View
        CreateView()
            .preferredColorScheme(.dark)
    }
}


//                HStack{
//                    ForEach(trees){
//                        tree in
////
////                        Image("\(tree.name)_active")
////                            .resizable()
////                            .frame(width: 310, height: 359)
//                    }
//                }
//                .modifier(ScrollingHStackModifier(items: 3, itemWidth: 300, itemSpacing: 10, currentPageIndex: $currentPageIndex))
                
