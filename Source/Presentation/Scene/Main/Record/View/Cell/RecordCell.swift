//
//  RecordCell.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

final class RecordCell: BaseTableViewCell<KcalWithDay>{
    // MARK: - Properties
    private let view: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 20
        return v
    }()
    
    private let kcalLabel: UILabel = {
        let v = UILabel()
        v.font = UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 18)
        return v
    }()
    
    private let dateLabel: UILabel = {
        let v = UILabel()
        v.font = UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 12)
        return v
    }()
    
    private let isGoadLabel: UILabel = {
        let v = UILabel()
        v.textColor = .lightGray
        v.font = UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 10)
        return v
    }()
    
    private let leftStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    // MARK: - UI
    override func addView() {
        contentView.addSubViews(view)
        leftStack.addArrangeSubviews([dateLabel, isGoadLabel])
        view.addSubViews(kcalLabel, leftStack)
    }
    override func setLayout() {
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            view.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            kcalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            kcalLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            leftStack.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            leftStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    override func configureCell() {
        
    }
    
    override func bind(_ model: KcalWithDay) {
        
    }
}
