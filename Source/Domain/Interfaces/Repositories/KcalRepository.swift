//
//  KcalRepository.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

protocol KcalRepository{
    func setKcal(kcal: Int)
    func getKcal() -> Int
}
