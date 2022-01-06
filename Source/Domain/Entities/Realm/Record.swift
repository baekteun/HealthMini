//
//  Record.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

import RealmSwift

final class Record: Object{
    @Persisted(primaryKey: true) var id: String
    @Persisted var date: Date
    @Persisted var kcal: Int
    @Persisted var isComplete: Bool
    
    convenience init(date: Date, kcal: Int, isComplete: Bool) {
        self.init()
        self.id = UUID().uuidString
        self.date = date
        self.kcal = kcal
        self.isComplete = isComplete
    }
}
