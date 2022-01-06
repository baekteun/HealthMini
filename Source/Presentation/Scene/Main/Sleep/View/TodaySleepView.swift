//
//  TodaySleepView.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

final class TodaySleepView: UIView{
    // MARK: - Properties
    private let todaySleepLabel: UILabel = {
        let lb = UILabel()
        lb.text = "오늘의 수면시간"
        lb.textColor = .white
        lb.font = UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 20)
        return lb
    }()
    
    private let sleepTimeLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 20)
        lb.textColor = .white
        lb.textAlignment = .right
        return lb
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Method
    func bind(time: Int){
        
        self.sleepTimeLabel.text = "\(time)시간"
    }
}

// MARK: - UI
private extension TodaySleepView{
    func addView(){
        addSubViews(todaySleepLabel, sleepTimeLabel)
    }
    func setLayout(){
        NSLayoutConstraint.activate([
            todaySleepLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            todaySleepLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            
            sleepTimeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            sleepTimeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40)
        ])
    }
    func configureView(){
        self.backgroundColor = UIColor(red: 0.2392, green: 0, blue: 0.749, alpha: 1)
        self.layer.cornerRadius = 22
        self.clipsToBounds = true
    }
}
