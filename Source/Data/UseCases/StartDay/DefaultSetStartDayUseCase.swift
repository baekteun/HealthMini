//
//  DefaultSetStartDayUseCase.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

final class DefaultSetStartDayUseCase: SetStartDayUseCase{
    private let repository: StartDayRepository
    
    init(repository: StartDayRepository){
        self.repository = repository
    }
    
    func execute(date: Date) {
        return repository.setFirstDay(date: date)
    }
}
