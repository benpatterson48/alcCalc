//
//  UIFont.swift
//  alcCalc
//
//  Created by Ben Patterson on 3/12/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

extension UIFont {
    static func customFont(name: String, size: CGFloat) -> UIFont {
        let font = UIFont(name: name, size: size)
        assert(font != nil, "Can't load font: \(name)")
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    static func mainFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "Montserrat-Regular", size: size)
    }
    
    static func mainItalicFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "Montserrat-Italic", size: size)
    }
    
    static func mainMediumFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "Montserrat-Medium", size: size)
    }
    
    static func mainSemiBoldFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "Montserrat-SemiBold", size: size)
    }
    
    static func mainBoldFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "Montserrat-Bold", size: size)
    }
}
