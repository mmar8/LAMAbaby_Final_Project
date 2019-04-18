//
//  NewScheduleVC.swift
//  LamaBaby
//
//  Created by Amina on 18/04/2019.
//  Copyright © 2019 Sexy Lama Ltd. All rights reserved.
//

import UIKit

class NewSchedule: UIViewController, ItemComplitedDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var items = [ScheduleItem]()
    var item1 = ScheduleItem(title: "Breakfast", time: "08:00")
    
    @IBOutlet weak var itemsTableVIew: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        itemsTableVIew.dataSource = self
        itemsTableVIew.delegate = self
        
        items.append(item1)
    }
    
    func savedButtonPressed(title: String, time: String) {
        let newItem = ScheduleItem(title: title, time: time)
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
        cell.textLabel?.text = "\(self.items[indexPath.row].time ?? "No Time"): \(self.items[indexPath.row].title ?? "No Description")"
        return cell
    }
}

protocol ItemComplitedDelegate {
    
    func savedButtonPressed(title: String, time: String)
}







