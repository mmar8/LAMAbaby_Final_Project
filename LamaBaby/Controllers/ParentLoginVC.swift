//
//  parentLoginVC.swift
//  LamaBaby
//
//  Created by Andrew on 19/04/2019.
//  Copyright © 2019 Sexy Lama Ltd. All rights reserved.
//

import UIKit

class ParentLoginVC: UIViewController {
    
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    let myPassword = "123345"
    let myName = "dave"
    
    override func viewDidLoad() {
       super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userName.text = ""
        password.text = ""
    }
    
    @IBAction func btnSubmitPress(_ sender: Any) {
        let user = userName.text!
        let pword = password.text!
        if user == myName && pword == myPassword {
            print("password match")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyBoard.instantiateViewController(withIdentifier: "ScheduleListVC") as! ScheduleListVC
            self.present(viewController, animated: true, completion: nil)
        } else {
            feedbackLabel.text = "Bad credentials. Try again."
        }
    }    
}
