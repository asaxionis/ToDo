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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func hasTapped(_ sender: Any) {
        
        //Creates a task from the outlet information
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        let task = Task(context: context)
        
        //if TaskNameTextField != nil {}
        
        task.name = TaskNameTextField.text!
        task.isImportant = ImportantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //Pop Back
        
        
        navigationController!.popViewController(animated: true)
    }
    
    
}
