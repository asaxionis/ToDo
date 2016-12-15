//
//  CompleteTaskViewController.swift
//  ToDo App
//
//  Created by Andrew Saxionis on 12/15/16.
//  Copyright © 2016 Andrew Saxionis. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    
    
    var task : Task? = nil
    

    @IBOutlet weak var theTask: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if task!.isImportant {
            theTask.text = "🌡\(task!.name!)"
        } else {
            theTask.text = task!.name!
        }

        
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func hasCompleted(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()

        navigationController!.popViewController(animated: true)
        
    }
   

    
    

   

}
