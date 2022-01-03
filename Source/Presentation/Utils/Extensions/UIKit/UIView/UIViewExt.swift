//
//  UIViewExt.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

extension UIView{
    func asImage() -> UIImage{
        UIGraphicsBeginImageContext(self.frame.size)
        self.layer.render(in:UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return UIImage(cgImage: image!.cgImage!)
    }
    
    func addSubViews(_ subView: UIView...){
        subView.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        subView.forEach(addSubview(_:))
    }
}

