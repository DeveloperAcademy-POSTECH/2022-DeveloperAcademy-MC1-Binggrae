//
//  TreeListView.swift
//  MC1-Binggrae
//
//  Created by Kim Insub on 2022/04/07.
//

import SwiftUI

struct TreeListView: View {
    
    //Define
    @Binding var title: String
    @Binding var description: String
    @Binding var isNext: Bool
    @Binding var selectedTree: Tree?
    
    //init
    func initialize(){
            UITableView.appearance().backgroundColor = .clear
            UITableViewCell.appearance().backgroundColor = .clear
            UITableView.appearance().tableFooterView = UIView()
     }

    //body
    var body: some View {
        
        VStack(){
            
            //X Button
            XButtonView()
            
            let notoMedium = "NotoSansCJKkr-Medium"
            
            //Page Title
            Text("장작선택")
                .font(.custom(notoMedium, size: 20))
                .padding(15)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
            
            //Tree List
            List {
                ForEach(trees){
                    tree in
                    
                    //Tree Row
                    TreeRowView(
                        selectedTree: $selectedTree,
                        tree: tree
                    )
                    .listRowInsets(EdgeInsets())
                }
            }
            .listStyle(PlainListStyle())
            .onAppear(){
                isNext = true
                self.initialize()
            }
            
            //Empty Space
            Text("")
                .frame(height: 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.bottom, 50)
    }
}

//struct TreeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        TreeListView()
//    }
//}
