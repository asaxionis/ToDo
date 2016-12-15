//
//  CreateTaskViewController.swift
//  ToDo App
//
//  Created by Andrew Saxionis on 12/14/16.
//  Copyright © 2016 Andrew Saxionis. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var TaskNameTextField: UITextField!
    @IBOutlet weak var ImportantSwitch: UISwitch!
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func hasTapped(_ sender: Any) {
        
        //Creates a task from the outlet information
        let task = Task()
        task.name = TaskNameTextField.text!
        task.isImportant = ImportantSwitch.isOn
        
        //Add new task to array in previous viewController
    }
    
    
}
