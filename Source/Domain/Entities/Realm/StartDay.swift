//
//  FirstDay.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import RealmSwift

final class StartDay: Object{
    @Persisted var startDay: Date
    
    convenience init(firstDay: Date = Date()) {
        self.init()
        self.startDay = firstDay
    }
}
