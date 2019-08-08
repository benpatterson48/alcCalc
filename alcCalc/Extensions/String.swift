//
//  String.swift
//  alcCalc
//
//  Created by Ben Patterson on 8/7/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

extension String {
	func increaseLetterSpacing() -> NSMutableAttributedString {
		let stringValue = self
		let attrString = NSMutableAttributedString(string: stringValue)
		let style = NSMutableParagraphStyle()
		attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: stringValue.count))
		attrString.addAttribute(NSAttributedString.Key.kern, value: 1.4, range: NSMakeRange(0, attrString.length))
		return attrString
	}
	
	func increaseLineSpacing() -> NSMutableAttributedString {
		let stringValue = self
		let attrString = NSMutableAttributedString(string: stringValue)
		let style = NSMutableParagraphStyle()
		style.lineSpacing = 6
		attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: stringValue.count))
		return attrString
	}
}
