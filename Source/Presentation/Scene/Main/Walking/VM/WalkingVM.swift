//
//  WalkingVM.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

final class WalkingVM: baseViewModel{
    // MARK: - Properties
    private let getAllStepWithDayUseCase: GetAllStepWithDayUseCase
    
    // MARK: - Init
    override init(coordinator: baseCoordinator) {
        getAllStepWithDayUseCase = AppDI.shared.getDefaultGetAllStepWithDayUseCase()
        super.init(coordinator: coordinator)
    }
    
    // MARK: - Method
    func viewDidLoad(){
        getAllStepWithDayUseCase.execute()
    }
}
