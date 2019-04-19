//
//  ScheduleList.swift
//  LamaBaby
//
//  Created by Andrew on 19/04/2019.
//  Copyright © 2019 Sexy Lama Ltd. All rights reserved.
//

import UIKit

class ScheduleList: UIViewController, ScheduleCompletedDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var schedules = [ScheduleListModel]()
    @IBOutlet weak var scheduleListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        scheduleListTableView.dataSource = self
        scheduleListTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newSchedule" {
            let newScheduleVC = segue.destination as! NewScheduleVC
            newScheduleVC.delegate = self
        }
    }
    
    func saveSchedule(scheduleName: String, scheduleItems: [ScheduleItemModel]) {
        print("items: \(scheduleItems.count)")
        let schedule = ScheduleListModel(listName: scheduleName, scheduleItems: scheduleItems)
        print("built this schedule: \(String(describing: schedule.schedules))")
        self.schedules.append(schedule)
        print("SCHED: \(self.schedules.count)")
        self.scheduleListTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.schedules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleListCell", for:  indexPath) as UITableViewCell
        let schedule = self.schedules[indexPath.row]
        cell.textLabel?.text = schedule.listName
        return cell
    }
    
}

protocol ScheduleCompletedDelegate {
    func saveSchedule(scheduleName: String, scheduleItems: [ScheduleItemModel])
}
