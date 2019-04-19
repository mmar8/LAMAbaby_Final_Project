//
//  ScheduleList.swift
//  LamaBaby
//
//  Created by Andrew on 19/04/2019.
//  Copyright © 2019 Sexy Lama Ltd. All rights reserved.
//

import Foundation

class ScheduleListModel {
    
    var listName: String = ""
    var schedules = [ScheduleItemModel]()
    
    init(listName: String, scheduleItems: [ScheduleItemModel]) {
        self.listName = listName
        self.schedules = scheduleItems
    }
}
