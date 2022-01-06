//
//  GetSleepTimeUseCase.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

protocol GetSleepTimeUseCase{
    func execute(completion: @escaping((Int?, Error?)) -> Void)
}
