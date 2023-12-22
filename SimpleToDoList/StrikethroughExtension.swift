//
//  StrikethroughExtension.swift
//  SimpleToDoList
//
//  Created by 영현 on 12/21/23.
//

import Foundation
import UIKit
extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        
        attributeString.addAttribute(.strikethroughStyle,
                                     value: NSUnderlineStyle.single.rawValue,
                                     range: NSMakeRange(0, attributeString.length))
        
        return attributeString
    }
    func nonStrikeThrough() -> NSAttributedString {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        
        attributeString.addAttribute(.strokeWidth,
                                     value: 0,
                                     range: NSMakeRange(0, attributeString.length))
        
        return attributeString
    }
}
