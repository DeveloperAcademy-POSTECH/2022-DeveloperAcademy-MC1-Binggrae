//
//  CardTitleView.swift
//  MC1-Binggrae
//
//  Created by Kim Insub on 2022/04/12.
//

import SwiftUI

struct CardsTitleView: View {
    
    //Define
    let notoLight = "NotoSansCJKkr-Light"
    let notoThin = "NotoSansCJKkr-Thin"

    var body: some View {
        
        //CardTitle
        HStack{
            
            //Define
            let one = Text("1").font(.custom(notoThin, size: 54))

            Text("\(one)  장작을 선택하세요")
                .font(.custom(notoLight, size: 18))
            Spacer()
        }
        .padding(.top,140)
    }
}

struct CardsTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CardsTitleView()
    }
}
