//
//  DefaultSetKcalUseCase.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

final class DefaultSetKcalUseCase: setKcalUseCase{
    let kcalRepository: KcalRepository
    
    init(repository: KcalRepository){
        self.kcalRepository = repository
    }
    
    func execute(kcal: Int) {
        kcalRepository.setKcal(kcal: kcal)
    }
}
