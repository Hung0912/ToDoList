//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Bảo  Hưng on 6/25/19.
//  Copyright © 2019 Bảo  Hưng. All rights reserved.
//

import Foundation

class ToDoItem{
    var title: String
    var startDate: String
    var endDate: String?
    var content: String?
    var isDone: Bool
    
    init(title: String) {
        self.title = title
        self.isDone = false
        
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        self.startDate = "\(day)/\(month)"
    }
}
