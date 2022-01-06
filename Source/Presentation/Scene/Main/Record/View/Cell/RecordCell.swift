//
//  RecordCell.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit


final class RecordCell: BaseTableViewCell<Record>{
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
        v.textAlignment = .center
        v.font = UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 12)
        return v
    }()
    
    private let isCompleteLabel: UILabel = {
        let v = UILabel()
        v.textColor = .lightGray
        v.textAlignment = .center
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
        leftStack.addArrangeSubviews([dateLabel, isCompleteLabel])
        view.addSubViews(kcalLabel, leftStack)
    }
    override func setLayout() {
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            kcalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            kcalLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            leftStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            leftStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    override func configureCell() {
        self.selectionStyle = .none
        view.addShadow(color: .lightGray, radius: 2, offSet: .init(width: 0, height: 2), opacity: 1)
    }
    
    override func bind(_ model: Record) {
        kcalLabel.text = "\(model.kcal)kcal"
        dateLabel.text = "\(model.date.dateToString())"
        isCompleteLabel.text = model.isComplete ? "목표달성" : "목표미달성"
        
    }
}
