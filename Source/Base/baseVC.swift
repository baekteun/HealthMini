//
//  baseViewController.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

class baseVC<T: baseViewModel>: UIViewController{
    let bound = UIScreen.main.bounds
    
    let viewModel: T
    
    init(viewModel: T){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @available(*, unavailable)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
        addView()
        setLayout()
        configureVC()
        bindVM()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    deinit{
        print("\(type(of: self)): \(#function)")
    }
    
    func setUp(){}
    func addView(){}
    func setLayout(){}
    func configureVC(){}
    func bindVM(){}
}
