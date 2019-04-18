//
//  AddItemVC.swift
//  LamaBaby
//
//  Created by Amina on 18/04/2019.
//  Copyright © 2019 Sexy Lama Ltd. All rights reserved.
//

import UIKit

class AddItemVC: UIViewController {
    
    @IBOutlet weak var Task: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    var delegate: ItemComplitedDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Add item loaded")
    }
    
    @IBAction func btnSavePressed(_ sender: Any) {
        
        let timeFormat = timePicker.date
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "HH:mm"
        let selectedDate = dateFormat.string(from: timeFormat)
        print(selectedDate)
        let task = Task.text
        self.delegate?.savedButtonPressed(title: task!, time: selectedDate)
        self.dismiss(animated: true, completion: nil)
        
    }
}



