//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Bảo  Hưng on 6/25/19.
//  Copyright © 2019 Bảo  Hưng. All rights reserved.
//

import Foundation

class ToDoItem{
    var todoTitle: String?
    var date: String?
    var isDone: Bool
    
    init(title: String, day: String, isDone: Bool) {
        self.todoTitle = title
        self.date = day
        self.isDone = isDone
    }
}
