//
//  NSMutableAttributedStringExt.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString{
    func setFontForText(textToFind: String, withFont font: UIFont){
        let range: NSRange = self.mutableString.range(of: textToFind,options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.font, value: font, range: range)
    }
    func appendImage(_ image: UIImage){
        let imageAttchment = NSTextAttachment()
        imageAttchment.image = image
        
        let strImage = NSAttributedString(attachment: imageAttchment)
        self.append(strImage)
    }
}
