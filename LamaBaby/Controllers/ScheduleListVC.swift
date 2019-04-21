//
//  ScheduleList.swift
//  LamaBaby
//
//  Created by Andrew on 19/04/2019.
//  Copyright © 2019 Sexy Lama Ltd. All rights reserved.
//

import UIKit

class ScheduleListVC: UIViewController, ScheduleCompletedDelegate, UITableViewDelegate, UITableViewDataSource {
    
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
        let schedule = ScheduleListModel(listName: scheduleName, scheduleItems: scheduleItems)
        self.schedules.append(schedule)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSchedule = schedules[indexPath.row]
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let showScheduleViewController = storyBoard.instantiateViewController(withIdentifier: "ShowScheduleViewController") as! ShowScheduleViewController
        showScheduleViewController.schedule = selectedSchedule
        self.present(showScheduleViewController, animated: true, completion: nil)
    }
    
    @IBAction func btnLogoutTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

protocol ScheduleCompletedDelegate {
    func saveSchedule(scheduleName: String, scheduleItems: [ScheduleItemModel])
}
