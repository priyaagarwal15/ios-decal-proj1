//
//  Task.swift
//  To-Do List
//
//  Created by Priya Agarwal on 10/17/16.
//  Copyright © 2016 Priya Agarwal. All rights reserved.
//

import UIKit

class Task {
    var text: String
    var done: Bool
    var time: CFAbsoluteTime?
    
    init(text: String, done: Bool) {
        self.text = text
        self.done = done
        self.time = nil
    }
}
