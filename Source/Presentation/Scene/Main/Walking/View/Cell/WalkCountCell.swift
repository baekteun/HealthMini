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
    private let view: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 20
        return v
    }()
    
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
        contentView.addSubViews(view)
        view.addSubViews(stepLabel, dateLabel)
    }
    override func setLayout() {
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            view.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            stepLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stepLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            dateLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    override func configureCell() {
        view.addShadow(color: .lightGray, radius: 2, offSet: .init(width: 0, height: 2), opacity: 1)
    }
    
    override func bind(_ model: StepWithDay) {
        stepLabel.text = "\(model.stepCount)걸음"
        dateLabel.text = "\(model.date.dateToString())"
    }
}
