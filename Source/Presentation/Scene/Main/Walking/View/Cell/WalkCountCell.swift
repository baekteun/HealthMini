//
//  WalkCountCell.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/05.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

final class WalkCountCell: BaseTableViewCell<StepWithDay>{
    // MARK: - Properties
    private let stepLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 18)
        return lb
    }()
    
    private let dateLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 12)
        lb.textAlignment = .right
        return lb
    }()
    
    // MARK: - UI
    override func addView() {
        addSubViews(stepLabel, dateLabel)
    }
    override func setLayout() {
        NSLayoutConstraint.activate([
            stepLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stepLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    override func configureCell() {
        self.layer.cornerRadius = 20
        self.addShadow(color: .black, radius: 2, offSet: CGSize(width: 0, height: 1), opacity: 1)
    }
    
    override func bind(_ model: StepWithDay) {
        
    }
}
