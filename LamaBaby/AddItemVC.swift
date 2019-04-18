//
//  AddItemVC.swift
//  LamaBaby
//
//  Created by Amina on 18/04/2019.
//  Copyright © 2019 Sexy Lama Ltd. All rights reserved.
//

import UIKit

class AddItemVC: UIViewController {
    
    var delegate: ItemComplitedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Add item loaded")
        
        
    }
    @IBAction func btnSavePressed(_ sender: Any) {
        self.delegate?.savedButtonPressed(title: "Test", time: "2:15")
        self.dismiss(animated: true, completion: nil)
    }
}



