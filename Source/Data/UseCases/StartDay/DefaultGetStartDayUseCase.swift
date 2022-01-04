//
//  DefaultGetStartDayUseCase.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

final class DefaultGetStartDayUseCase: GetStartDayUseCase{
    private let repository: StartDayRepository
    
    init(repository: StartDayRepository){
        self.repository = repository
    }
    
    func execute() -> Date {
        return repository.getFirstDay()
    }
}
