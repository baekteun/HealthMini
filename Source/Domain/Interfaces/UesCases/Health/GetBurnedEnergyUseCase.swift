//
//  GetBurnedEnergyUseCase.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

protocol GetBurnedEnergyUseCase{
    func execute(completion: @escaping(([KcalWithDay]? ,Error?)) -> Void)
}
