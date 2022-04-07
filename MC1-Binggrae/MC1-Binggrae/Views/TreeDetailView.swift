//
//  TreeDetailView.swift
//  MC1-Binggrae
//
//  Created by Kim Insub on 2022/04/07.
//

import SwiftUI

struct TreeDetailView: View {
    
    var tree: Tree
    let notoMedium = "NotoSansCJKkr-Medium"

    
    var body: some View {
        HStack{
            //장작이미지
            tree.image
                .resizable()
                .frame(maxWidth: 150, maxHeight: 75)
            
            //장작이름, 분, 설명
            VStack(alignment: .leading, spacing: 10){
                Text("\(tree.name) / \(tree.time)분")
                    .font(.custom(notoMedium, size: 20))
                Text(tree.description)
                    .font(.custom(notoMedium, size: 15))

            }
            .frame(maxHeight: 120)
        }
    }
}

//struct TreeDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TreeDetailView()
//    }
//}
