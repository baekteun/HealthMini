//
//  Kcal.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import RealmSwift

final class Kcal: Object{
    @Persisted var kcal: Int = 2000
    
    convenience init(kcal: Int){
        self.init()
        self.kcal = kcal
    }
}
