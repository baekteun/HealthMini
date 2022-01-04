//
//  MainVC.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit
import RealmSwift

final class MainVC: baseVC<baseViewModel>{
    // MARK: - Properties
    
    
    // MARK: - UI
    override func addView() {
        
    }
    override func setLayout() {
        
    }
    override func configureVC() {
        view.backgroundColor = .green
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
}
