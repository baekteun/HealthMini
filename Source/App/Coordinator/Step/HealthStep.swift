//
//  HealthStep.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 baegteun. All rights reserved.
//

enum HealthStep{
    // Global
    case alert(title: String?, message: String?)
    case dismiss
    
    // Goal
    case tutorialIsRequired
    case tutorialIsCompleted
    
    // Main
    case mainIsRequired
    case walkingIsRequired
    case recordIsRequired
    case sleepIsRequired
}
