//
//  MainVM.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

enum HealthKind: String{
    case WALKING
    case RECORD
    case SLEEP
}

final class MainVM: baseViewModel{
    var dataSource = Observable([HealthKind]())
    
    func setDatasource(data: [HealthKind]) {
        self.dataSource.value = data
    }
    
    func setGoalCount() {
        
    }
}
