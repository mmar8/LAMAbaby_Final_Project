//
//  ShowScheduleViewController.swift
//  LamaBaby
//
//  Created by Andrew on 21/04/2019.
//  Copyright © 2019 Sexy Lama Ltd. All rights reserved.
//

import UIKit

class ShowScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var scheduleItemsTableView: UITableView!
    @IBOutlet weak var scheduleTitleLabel: UILabel!
    var schedule: ScheduleListModel?
    private let carerCode: String = "134657"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scheduleItemsTableView.dataSource = self
        self.scheduleItemsTableView.delegate = self
        
        if let listName = schedule?.listName {
            scheduleTitleLabel.text = listName
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule!.schedules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleItemCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = "\(schedule!.schedules[indexPath.row].time): \(schedule!.schedules[indexPath.row].title)"
        return cell
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Carer Code", message: "Please share this code with your carer: \(carerCode)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
