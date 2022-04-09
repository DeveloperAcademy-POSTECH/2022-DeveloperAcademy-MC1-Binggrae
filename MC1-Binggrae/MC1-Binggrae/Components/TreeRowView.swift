//
//  TreeRowView.swift
//  MC1-Binggrae
//
//  Created by Kim Insub on 2022/04/07.
//

import SwiftUI

struct TreeRowView: View {
    
    
    //Define
    @Binding var selectedTree: Tree?
    
    var tree: Tree
    let notoMedium = "NotoSansCJKkr-Medium"
    
    //bodyd
    var body: some View {
        
        //Tree
        Button{
            selectedTree = tree
        } label: {
            HStack{
                
                //Tree Image
                tree.image
                    .resizable()
                    .frame(maxWidth: 150, maxHeight: 75)
                
                let black = Color.black
                
                //Tree Name, Time, Description
                VStack(alignment: .leading, spacing: 10){
                    Text("\(tree.name) / \(tree.time)분")
                        .font(.custom(notoMedium, size: 20))
                        .foregroundColor(black)
                    Text(tree.description)
                        .font(.custom(notoMedium, size: 15))
                        .foregroundColor(black)

                }
                .frame(maxHeight: 120)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(selectedTree?.id == tree.id ? Color.gray.opacity(0.1) : Color.white)
        .listRowInsets(EdgeInsets())
    
    }

}

//struct TreeRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TreeRowView()
//    }
//}
