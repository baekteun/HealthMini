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
    private let getTotalStepUseCase: GetTotalStepUseCase
    
    var totalStep = Observable(0)
    var averageStep = Observable(0)
    
    // MARK: - Init
    override init(coordinator: baseCoordinator) {
        getAllStepWithDayUseCase = AppDI.shared.getDefaultGetAllStepWithDayUseCase()
        getTotalStepUseCase = AppDI.shared.getDefaultGetTotalStepUseCase()
        super.init(coordinator: coordinator)
    }
    
    // MARK: - Method
    func viewDidLoad(){
        Task{
            self.totalStep.value = try await getTotalStepUseCase.execute()
        }
        
    }
}
