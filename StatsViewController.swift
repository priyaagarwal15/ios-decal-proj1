//
//  StatsViewController.swift
//  To-Do List
//
//  Created by Priya Agarwal on 10/19/16.
//  Copyright © 2016 Priya Agarwal. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    var value = 0
    var tasksCount = 0

    @IBOutlet weak var myResultLabel: UILabel!
    
    @IBOutlet weak var taskCountLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myResultLabel.text = String(value)
        taskCountLabel.text = String(tasksCount)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
