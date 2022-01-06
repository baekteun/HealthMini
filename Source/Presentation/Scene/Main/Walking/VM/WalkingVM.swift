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
    
    var stepCount = Observable((0,0))
    var stepDatasource = Observable([StepWithDay]())
    
    // MARK: - Init
    override init(coordinator: baseCoordinator) {
        getAllStepWithDayUseCase = AppDI.shared.getDefaultGetAllStepWithDayUseCase()
        getTotalStepUseCase = AppDI.shared.getDefaultGetTotalStepUseCase()
        super.init(coordinator: coordinator)
    }
    
    // MARK: - Method
    func viewDidLoad(){
        
        getAllStepWithDayUseCase.execute { data, err in
            if let err = err{
                print(err.localizedDescription)
            }else{
                guard let data = data else { return }
                self.stepDatasource.value = data
                self.getTotalStepUseCase.execute { step, err in
                    if let err = err{
                        print(err.localizedDescription)
                    }else{
                        guard let step = step else { return }
                        self.stepCount.value.0 = step
                        if self.stepCount.value.0 != 0{
                            self.stepCount.value.1 = self.stepCount.value.0 / (self.stepDatasource.value.count + 1)
                        }
                        
                    }
                }
            }
        }
        
    }
}
