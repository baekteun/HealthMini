//
//  DefaultGetBurnedEnergyUseCase.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

final class DefaultGetBurnedEnergyUseCase: GetBurnedEnergyUseCase{
    private let repo: HealthRepository
    
    init(repo: HealthRepository) {
        self.repo = repo
    }
        
    func execute(completion: @escaping (([KcalWithDay]?, Error?)) -> Void) {
        repo.getBurnedEnergy(completion: completion)
    }
}
