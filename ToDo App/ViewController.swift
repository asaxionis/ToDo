//
//  ViewController.swift
//  ToDo App
//
//  Created by Andrew Saxionis on 12/14/16.
//  Copyright © 2016 Andrew Saxionis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

   
    //how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    //what goes inside the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.isImportant {
            cell.textLabel?.text = "🌡\(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }

    //What you see in the list
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.isImportant = false
        
        let task2 = Task()
        task2.name = "Go to the airport"
        task2.isImportant = true
        
        let task3 = Task()
        task3.name = "Finish finals"
        task3.isImportant = true
        
        return [task1, task2, task3]
    }

    //You click the plus button and you go to the next slide
    @IBAction func addTask(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
}

