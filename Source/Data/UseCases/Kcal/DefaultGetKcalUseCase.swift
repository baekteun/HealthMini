//
//  DefaultGetKcalUseCase.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//


final class DefaultGetKcalUseCase: GetKcalUseCase{
    let kcalRepository: KcalRepository
    
    init(repository: KcalRepository){
        self.kcalRepository = repository
    }
    
    func execute() -> Int {
        return kcalRepository.getKcal()
    }
}
