//
//  GetRecordsUseCase.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

protocol GetRecordsUseCase{
    func execute(completion: @escaping(([Record]?, Error?)) -> Void)
}
