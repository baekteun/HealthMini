//
//  ReusableID.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

protocol ReusableID{
    static var reusableID: String { get }
}

extension ReusableID{
    static var reusableID: String{
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableID {}
