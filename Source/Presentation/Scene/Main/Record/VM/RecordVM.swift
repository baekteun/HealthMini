//
//  RecordVM.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

final class RecordVM: baseViewModel{
    // MARK: - Properties
    
    
    
    var recordDatasources: [KcalWithDay] = []
    
    // MARK: - Init
    override init(coordinator: baseCoordinator) {
        
        super.init(coordinator: coordinator)
    }
    
    // MARK: - Method
    func viewDidAppear() {
        
    }
}
