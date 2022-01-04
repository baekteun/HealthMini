//
//  DefaultKcalRepository.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import RealmSwift

final class DefaultKcalRepository: KcalRepository{
    private let realm = try! Realm()
    
    func setKcal(kcal: Int) {
        let model = Kcal(kcal: kcal)
        
        try? realm.write {
            realm.add(model)
        }
    }
    
    func getKcal() -> Int {
        let kcal = realm.objects(Kcal.self).first ?? .init()
        return kcal.kcal
    }
    
    
}
