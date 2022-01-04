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
    // MARK: - Init
    override init(coordinator: baseCoordinator) {
        self.getStartDayUseCase = AppDI.shared.getDefaultGetStartDayUseCase()
        super.init(coordinator: coordinator)
    }
    
    // MARK: - Properties
    private let getStartDayUseCase: GetStartDayUseCase
    var dataSource = Observable([HealthKind]())
    var goalCount = Observable((Date(), 0))
    
    // MARK: - Method
    func setDatasource(data: [HealthKind]) {
        self.dataSource.value = data
    }
    
    func viewDidAppear() {
        self.goalCount.value.0 = getStartDayUseCase.execute()
    }
}
