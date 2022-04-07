//
//  Tree.swift
//  MC1-Binggrae
//
//  Created by Kim Insub on 2022/04/07.
//

import Foundation
import SwiftUI

struct Tree: Identifiable, Codable, Hashable {

    var name: String
    var id: Int
    var time: Int
    var description: String
    
    private var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
}
