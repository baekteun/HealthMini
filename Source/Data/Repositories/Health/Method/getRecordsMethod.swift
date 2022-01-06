//
//  getRecordsMethod.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

import RealmSwift

extension DefaultHealthRepository{
    func getRecordsMethod(completion: @escaping(([Record]?, Error?)) -> Void){
        let realm = try! Realm()
        let records = realm.objects(Record.self)
        completion((Array(records), nil))
    }
}
