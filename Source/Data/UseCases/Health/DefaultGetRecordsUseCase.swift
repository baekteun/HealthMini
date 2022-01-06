//
//  DefaultGetRecordsUseCase.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

final class DefaultGetRecordsUseCase: GetRecordsUseCase{
    let resp: HealthRepository
    
    init(resp: HealthRepository) {
        self.resp = resp
    }
    
    func execute(completion: @escaping (([Record]?, Error?)) -> Void) {
        resp.getRecords(completion: completion)
    }
}
