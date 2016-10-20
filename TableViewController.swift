//
//  TableViewController.swift
//  To-Do List
//
//  Created by Priya Agarwal on 10/17/16.
//  Copyright © 2016 Priya Agarwal. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    // MARK: Properties
    
    var tasks = [Task]()
    var doneCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector (TableViewController.timeOver), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                tasks[indexPath.row].done = false
                doneCount -= 1
                tasks[indexPath.row].time = nil
            } else {
                cell.accessoryType = .checkmark
                tasks[indexPath.row].done = true
                doneCount += 1
                tasks[indexPath.row].time = CFAbsoluteTimeGetCurrent()
            }
        }
        print(doneCount)

    }
    
    override func tableView(_ tableVies: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.text
        if (task.done == true) {
            cell.accessoryType = .checkmark
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.bottom)
        } else {
            cell.accessoryType = .none
        }
        return cell
    }

    @IBAction func unwindToTaskList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ViewController {
            //            let newIndexPath = IndexPath(forRow: tasks.count, inSection: 0)
            tasks.append(sourceViewController.task)
            //            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            self.tableView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //make sure that the segue is going to secondViewController
        if segue.destination is StatsViewController{
            // now set a var that points to that new viewcontroller so you can call the method correctly
            let destinationVC:StatsViewController = segue.destination as! StatsViewController
            destinationVC.value = doneCount
            destinationVC.tasksCount = tasks.count - doneCount
        }
    }
    
    func timeOver() {
        for task in tasks {
            if task.time! + 86400 < CFAbsoluteTimeGetCurrent() {
                doneCount -= 1
                tasks = tasks.filter { $0.text != task.text }
                self.tableView.reloadData()
            }
            
        }
    }

}
