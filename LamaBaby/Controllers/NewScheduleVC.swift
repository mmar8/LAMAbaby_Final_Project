//
//  NewScheduleVC.swift
//  LamaBaby
//
//  Created by Amina on 18/04/2019.
//  Copyright © 2019 Sexy Lama Ltd. All rights reserved.
//

import UIKit

class NewScheduleVC: UIViewController, ItemComplitedDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var items = [ScheduleItemModel]()
    var delegate: ScheduleCompletedDelegate?
    
    @IBOutlet weak var scheduleNameTextField: UITextField!
    @IBOutlet weak var itemsTableVIew: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        itemsTableVIew.dataSource = self
        itemsTableVIew.delegate = self
        
    }
    
    func savedButtonPressed(title: String, time: String) {
        let newItem = ScheduleItemModel(title: title, time: time)
        self.items.append(newItem)
        self.itemsTableVIew.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItemSegue" {
            let addItemVC = segue.destination as! AddItemVC
            addItemVC.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for:  indexPath) as UITableViewCell
        cell.textLabel?.text = "\(self.items[indexPath.row].time ) - \(self.items[indexPath.row].title )"
        return cell
    }
    
    @IBAction func btnSaveScheduleTapped(_ sender: Any) {
        if scheduleNameTextField.text != "" {
            self.delegate?.saveSchedule(scheduleName: scheduleNameTextField.text!, scheduleItems: self.items)
            self.dismiss(animated: true, completion: nil)
        } else {
            scheduleNameTextField.layer.borderWidth = 2.0
            scheduleNameTextField.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    @IBAction func btnCancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

protocol ItemComplitedDelegate {
    
    func savedButtonPressed(title: String, time: String)
}







