//
//  XButtonView.swift
//  MC1-Binggrae
//
//  Created by Kim Insub on 2022/04/07.
//

import SwiftUI

struct XButtonView: View {
    var body: some View {
        
        //X버튼
        Button{
        } label: {
            Image(systemName: "xmark")
                .foregroundColor(.black)
                .imageScale(.large)
        }
        .padding(.top, 20)
        .padding(.trailing, 20)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct XButtonView_Previews: PreviewProvider {
    static var previews: some View {
        XButtonView()
    }
}
