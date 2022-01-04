//
//  ExerciseKindCell.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

final class HealthKindCell: BaseCollectionViewCell<String>{
    // MARK: - Properties
    private let kindLabel: UILabel = {
       let lb = UILabel()
        lb.font = UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 20)
        return lb
    }()
    
    // MARK: - UI
    override func addView() {
        addSubViews(kindLabel)
    }
    override func setLayout() {
        NSLayoutConstraint.activate([
            kindLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 7),
            kindLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 7),
            kindLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20)
        ])
    }
    override func configureCell() {
        self.layer.cornerRadius = 27
        self.addShadow(color: .lightGray, radius: 2, offSet: .init(width: 0, height: 2), opacity: 1)
    }
    override func bind(_ model: String) {
        kindLabel.text = model
    }
}
