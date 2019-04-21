//
//  AddItemVC.swift
//  LamaBaby
//
//  Created by Amina on 18/04/2019.
//  Copyright © 2019 Sexy Lama Ltd. All rights reserved.
//

import UIKit

class AddItemVC: UIViewController {
    
    var futureDate: Date?
    
    @IBOutlet weak var itemTitle: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    var delegate: ItemComplitedDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSavePressed(_ sender: Any) {
        
        let timeFormat = timePicker.date
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "HH:mm"
        let selectedDate = dateFormat.string(from: timeFormat)
        let title = itemTitle.text!
        
        if title != "" {
            self.delegate?.savedButtonPressed(title: title, time: selectedDate)
            self.dismiss(animated: true, completion: nil)
        } else {
            itemTitle.layer.borderWidth = 2.5
            itemTitle.layer.borderColor = UIColor.red.cgColor
        }
        
    }
}



