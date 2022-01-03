//
//  baseViewController.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

class baseVC: UIViewController{
    let bound = UIScreen.main.bounds
    
    @available(*, unavailable)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        setLayout()
        configureUI()
    }
    
    deinit{
        print("\(type(of: self)): \(#function)")
    }
    
    func addView(){}
    func setLayout(){}
    func configureUI(){}
    
}
