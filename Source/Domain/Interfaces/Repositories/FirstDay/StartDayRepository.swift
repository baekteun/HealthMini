//
//  FirstDayRepository.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

protocol StartDayRepository{
    func setFirstDay(date: Date)
    func getFirstDay() -> Date
}
