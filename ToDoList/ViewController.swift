//
//  ViewController.swift
//  ToDoList
//
//  Created by Bảo  Hưng on 6/25/19.
//  Copyright © 2019 Bảo  Hưng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var toDoList : [ToDoItem] = [
        ToDoItem(title: "Do HomeWork", day: "24/06", isDone: false),
        ToDoItem(title: "Working out", day: "24/06", isDone: true)
        ]
    
    @IBOutlet weak var todoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.dataSource = self
        todoTableView.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func addToDoItemBtn(_ sender: Any) {
        let addItemAlert = UIAlertController(title: "Add ToDo Item", message: nil, preferredStyle: .alert)
        addItemAlert.addTextField()
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        addItemAlert.addAction(cancel)
        let add = UIAlertAction(title: "Add", style: .default, handler: { _ in
            if let text = addItemAlert.textFields?[0].text {
                let item = ToDoItem(title: text, day: "24/06", isDone: false)
                self.toDoList.append(item)
                self.todoTableView.reloadData()
            }

        })
        addItemAlert.addAction(add)
        self.present(addItemAlert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "CELL") as! ToDoCellTableViewCell
        cell.todoTitleLbl.text = toDoList[indexPath.row].todoTitle
        cell.dateLbl.text = toDoList[indexPath.row].date
        if toDoList[indexPath.row].isDone{
            cell.checkBox.isSelected = true
        }
        return cell
    }
    
    // Header table
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        return headerView

    }
    
    
}

