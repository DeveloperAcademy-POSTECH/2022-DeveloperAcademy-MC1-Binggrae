//
//  TreeListView.swift
//  MC1-Binggrae
//
//  Created by Kim Insub on 2022/04/07.
//

import SwiftUI

struct TreeListView: View {
    
    @Binding var isNext: Bool
    
    func initialize(){
            UITableView.appearance().backgroundColor = .clear
            UITableViewCell.appearance().backgroundColor = .clear
            
            UITableView.appearance().tableFooterView = UIView()
     }

    var body: some View {
        
        VStack(){
            
            //X버튼
            XButtonView()
            
            let notoMedium = "NotoSansCJKkr-Medium"
            
            //장작선택
            Text("장작선택")
                .font(.custom(notoMedium, size: 20))
                .padding(15)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
            
            Divider()
                .padding(.horizontal, 20)
            
            //장작리스트
            
            List {
                ForEach(trees){
                    tree in
                    TreeDetailView(tree: tree)
                }
            }
            .onAppear(){
                isNext = true
                self.initialize()
            }
            

            
//            //장작정보
//            Group{
//                //image
//                tree.image
//                    .resizable()
//                    .frame(width:150, height: 150)
//                //name
//                Text(tree.name)
//                    .font(.custom(notoBold, size: 20))
//                //time
//                Text("\(String(tree.time))분")
//                    .font(.custom(notoBold, size: 40))
//                //description
//                Text(tree.description)
//                    .font(.custom(notoBold, size: 20))
//                    .padding(.horizontal, 20)
//                    .multilineTextAlignment(TextAlignment.center)
//            }
//            .onAppear(){
//                isNext = true
//            }
            
                 
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background()
        .cornerRadius(30)
        .padding(.bottom, 50)
    }
}

//struct TreeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        TreeListView()
//    }
//}
