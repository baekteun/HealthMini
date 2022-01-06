//
//  DateExt.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

extension Date{
    func dateToString() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "ko_kr")
        return formatter.string(from: self)
    }
    func betweenDay(date: Date) -> Int{
        let res = Calendar.current.dateComponents([.day], from: self, to: date)
        return (res.day ?? 0) + 1
    }
    func formatTime() -> Date{
        var s = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        s.hour = 0
        s.minute = 0
        s.second = 0
        return Calendar.current.date(from: s) ?? .init()
    }
}
