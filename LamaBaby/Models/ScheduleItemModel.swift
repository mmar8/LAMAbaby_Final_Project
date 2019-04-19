//
//  ScheduleItem.swift
//  LamaBaby
//
//  Created by Amina on 18/04/2019.
//  Copyright © 2019 Sexy Lama Ltd. All rights reserved.
//

import Foundation

class ScheduleItemModel {
    
    var title: String = ""
    var time: String = ""
    
    init(title: String, time: String) {
        self.time = time
        self.title = title
    }
    
}
