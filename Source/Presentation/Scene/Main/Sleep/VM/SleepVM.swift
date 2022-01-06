//
//  SleepVM.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

final class SleepVM: baseViewModel{
    // MARK: - Properties
    private let getSleepTimeUseCase: GetSleepTimeUseCase
    
    var sleepTime = Observable(0)
    
    override init(coordinator: baseCoordinator) {
        self.getSleepTimeUseCase = AppDI.shared.getDefaultGetSleepTimeUseCase()
        super.init(coordinator: coordinator)
        getSleepTimeUseCase.execute { time, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            self.sleepTime.value = time ?? 0
        }
    }
}
