//
//  DefaultStartDayRepository.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit
import RealmSwift

final class DefaultStartDayRepository: StartDayRepository{
    private let realm = try! Realm()
    
    func setFirstDay(date: Date) {
        let model = StartDay(firstDay: date)
        
        try? realm.write{
            realm.add(model)
        }
    }
    func getFirstDay() -> Date {
        return realm.objects(StartDay.self).first?.startDay ?? .init()
    }
}
