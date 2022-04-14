
import Foundation
import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(a) / 255.0
        )
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
        
    }
    
    convenience init(argb: Int) {
        self.init(
            red: (argb >> 16) & 0xFF,
            green: (argb >> 8) & 0xFF,
            blue: argb & 0xFF,
            a: (argb >> 24) & 0xFF
        )
    }
    
    static func flameColor(_ frameColor:String) -> UIColor {
        if frameColor == "purple" {
            return UIColor.init(displayP3Red:  139/255.0,  green: 16/255.0, blue: 157/255.0, alpha: 0.6)
        } else if frameColor == "blue" {
            return UIColor.init(displayP3Red: 0, green: 82/255.0, blue: 130/255.0, alpha: 0.6)
        } else  {
            return UIColor.init(displayP3Red: 1, green: 0.4, blue: 0.2, alpha: 0.5)
        }
    }
}

//extension UIFont {
//    
//    enum Family: String {
//        case Black, Bold, Light, Medium, Regular, Thin
//    }
//    
//    static func roboto(size: CGFloat = 10, family: Family = .Regular) -> UIFont {
//        return UIFont(name: "Roboto-\(family)", size: size)!
//    }
//}
//
