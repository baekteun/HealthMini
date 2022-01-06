//
//  StepCountView.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

final class StepCountView: UIView{
    // MARK: - Properties
    private let totalStepLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.font = UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 20)
        lb.textAlignment = .right
        return lb
    }()
    
    private let averageStepLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.font = UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 20)
        lb.textAlignment = .right
        return lb
    }()
    
    private let stack: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.spacing = 10
        return s
    }()
    
    // MARK: - Init
    init(){
        super.init(frame: .zero)
        addView()
        setLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Method
    func bind(total: Int, average: Int){
        DispatchQueue.main.async {
            self.totalStepLabel.text = "총 \(total)걸음"
            self.averageStepLabel.text = "평균 \(average)걸음"
        }
        
    }
}

// MARK: - UI
private extension StepCountView{
    func addView(){
        stack.addArrangeSubviews([totalStepLabel, averageStepLabel])
        addSubViews(stack)
    }
    func setLayout(){
        NSLayoutConstraint.activate([
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25)
        ])
    }
    func configureView(){
        self.backgroundColor = HealthMiniAsset.healthMainColor.color
        self.layer.cornerRadius = 22
        self.clipsToBounds = true
    }
    
}
