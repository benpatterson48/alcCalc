//
//  UIColor.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/6/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

extension UIColor {
	struct Main {
		static let blue = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
		static let text = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
		static let background = #colorLiteral(red: 0.8392156863, green: 0.8745098039, blue: 0.9882352941, alpha: 1)
	}
	
	static var alcBlue: UIColor {
		if #available(iOS 13, *) {
			return systemBlue
		} else {
			return #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
		}
	}
	
	static var darkText: UIColor {
		if #available(iOS 13, *) {
			return label
		} else {
			return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
		}
	}
	
	static var lightText: UIColor {
		if #available(iOS 13, *) {
			return secondaryLabel
		} else {
			return #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
		}
	}
	
	static var alcWhite: UIColor {
		if #available(iOS 13, *) {
			return tertiarySystemBackground
		} else {
			return UIColor(red: 255, green: 255, blue: 255, alpha: 1)
		}
	}
}
