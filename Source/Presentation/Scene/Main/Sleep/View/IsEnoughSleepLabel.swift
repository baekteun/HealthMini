//
//  IsEnoughSleepLabel.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

final class IsEnoughSleepLabel: UILabel{
    // MARK: - Properties
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textAlignment = .center
        self.textColor = .white
        self.font = UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 15)
        self.layer.cornerRadius = 17
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Method
    func bind(time: Int) {
        let isEnough = time > 7
        self.backgroundColor = isEnough ? .init(red: 0.5921, green: 0.6823, blue: 1, alpha: 1) : .init(red: 0.2862, green: 0.3725, blue: 0.6705, alpha: 1)
        
        let str = NSMutableAttributedString(string: "")
        if isEnough{
            str.append(.init(string: "수면이 충분합니다."))
        }else{
            str.appendImage(.init(systemName: "exclamationmark.triangle")?.withTintColor(.white) ?? .init())
            str.append(.init(string: "수면이 충분하지 않습니다."))
        }
        self.attributedText = str
    }
}

