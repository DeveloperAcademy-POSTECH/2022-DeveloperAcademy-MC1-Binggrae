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
    @State private var isPresenting: Bool = false
    @State private var firewoodData: Firewood?
    @State private var isShowing: Bool = false
    @State var currentPageIndex: CGFloat = 2
    
    let isRegular = false
    let totalTree = trees.count
    
    //Fonts
    let notoThin = "NotoSansCJKkr-Thin"
    let notoLight = "NotoSansCJKkr-Light"
    let notoRegular = "NotoSansCJKkr-Regular"
    let notoMedium = "NotoSansCJKkr-Medium"

    //Colors
    let buttonFontColor = Color(red: 63 / 255, green: 63 / 255, blue: 63 / 255)

    //init
    init() {
            UITextView.appearance().backgroundColor = .clear
    }

    //body
    var body: some View {
        
        ScrollView{
            ZStack {
                VStack{
                    
                    //1 장작을 선택하세요
                    CardsTitleView()
                    
                    //Tree Cards
                    HStack{
                        ForEach(trees, id:\.self){
                            tree in

                            let isSelected: Bool = selectedTree?.name == tree.name
                            let imageName: String = isSelected ? "\(tree.name)_deactive" : "\(tree.name)_active"

                            Image(imageName)
                                .resizable()
                                .frame(width: 310, height: 359)
                                .onTapGesture {
                                    selectedTree = tree
                                }
                        }
                        .modifier(ScrollingHStackModifier(items: 3, itemWidth: 310, itemSpacing: 4, currentPageIndex: $currentPageIndex))
                    }
                    .frame(width: 310, height: 359)
                    .padding(.top, -20)

                    //Indicator
                    HStack{
                        ForEach(0..<totalTree){
                            i in
                            Circle()
                                .fill(currentPageIndex == CGFloat(i) ? Color.white : Color.gray)
                                .frame(width: 4, height: 4)
                                .padding(4)
                        }
                    }
                    .padding(.top,30)
                    .environment(\.layoutDirection, isRegular ? .leftToRight : .rightToLeft)

          
                    //2 장작과 함께 태울 것을 적어보세요
                    HStack{
                        let two = Text("2").font(.custom(notoThin, size: 54))

                        Text("\(two)  장작과 함께 태울 것을 적어보세요")
                            .font(.custom(notoLight, size: 18))
                        Spacer()
                    }
                    
                    //Text Inputs
                    TextInputsView(title: $title, description: $description)
                        .padding(.top, -20)
                    
                    //태우기 Button
                    Button {
                        let tree = selectedTree
                        if selectedTree != nil {
                            firewoodData = Firewood(title: title, description: description, tree: tree!)
                            isPresenting.toggle()
                        } else {
                            isShowing = true
                        }
                    } label: {

                        Text("태우기")
                            .foregroundColor(Color.white)
                            .font(.custom(notoMedium, size: 18))
                            .kerning(5)
                            .frame(width: 200, height: 70)
                    }
                    .fullScreenCover(isPresented: $isPresenting, content: {
                        //성냥 긋기
                        if selectedTree != nil {
                            MatchView(firewoodData: $firewoodData)
                        }
                        
                    })
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 30)
                .opacity(isShowing ? 0.3 : 1)
                SelectionAlertView(isShowing: $isShowing)
                    .frame(width: 320, height: 240)
                    .offset(y: 320)
            }
        }
    }
}

//                        SelectionAlertView(isShowing: $isShowing)
//                            .frame(width: 320, height: 240)
//                            .offset(y:-60)

//Preview
struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        //View
        CreateView()
            .preferredColorScheme(.dark)
    }
}
