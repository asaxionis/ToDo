//
//  TasksViewController.swift
//  ToDo App
//
//  Created by Andrew Saxionis on 12/14/16.
//  Copyright © 2016 Andrew Saxionis. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //Everytime the view controller is about to show up on the screen
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
        
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
            cell.textLabel?.text = "🌡\(task.name!)"
        } else {
            cell.textLabel?.text = task.name!
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    

    //You click the plus button and you go to the next slide
    @IBAction func addTask(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
           tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        } catch {
            print("we have a problem!")
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
            
            
        }
    }
}

