//
//  ViewController.swift
//  ToDoList
//
//  Created by Bảo  Hưng on 6/25/19.
//  Copyright © 2019 Bảo  Hưng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var sectionTitles : [String] = ["List", "Completed"]
    
    var toDoList : [ToDoItem] = [
        ToDoItem(title: "Do HomeWork"),
        ToDoItem(title: "Working out")
        ]
    
    @IBOutlet weak var todoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.dataSource = self
        todoTableView.delegate = self
        
        toDoList[1].isDone = true
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        // Do any additional setup after loading the view.
    }

    @objc func loadList(){
        //load data here
        self.todoTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.todoTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let countDone = toDoList.filter {$0.isDone}.count
        if section == 0{
            return toDoList.count - countDone
        }
        if section == 1 {
            return countDone
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "CELL") as! ToDoCellTableViewCell
        cell.todoTitleLbl.text = toDoList[indexPath.row].title
        cell.dateLbl.text = toDoList[indexPath.row].startDate
        if toDoList[indexPath.row].isDone{
            cell.checkBox.setImage(UIImage(named: "checked_icon"), for: .selected)
        }
        return cell
    }
    
    // Header of section
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let headerView = UIView()
        headerView.backgroundColor = UIColor.orange
        
        let headerIcon = UIImageView(image: UIImage(named: "list_icon"))
        headerIcon.frame = CGRect(x: 5, y: 5, width: 32, height: 32)
        headerIcon.contentMode = .scaleAspectFit
        
        let headerTitle = UILabel(frame: CGRect(x: 42, y: 5, width: 100, height: 35))
        headerTitle.font = UIFont.systemFont(ofSize: 15)
        headerTitle.textAlignment = .left
        if section == 0 {
            headerTitle.text = "List"
        }else if section == 1 {
            headerTitle.text = "Completed"
        }

        headerView.addSubview(headerIcon)
        headerView.addSubview(headerTitle)
 
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 47
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let detailScreen = sb.instantiateViewController(withIdentifier: "DetailScreen") as! ItemDetailVC
        self.navigationController?.pushViewController(detailScreen, animated: true)
        //TODO
    }
    
    @IBAction func addToDoItemBtn(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let addScreen = sb.instantiateViewController(withIdentifier: "AddScreen") as! AddItemVC
        self.navigationController?.pushViewController(addScreen, animated: true)
        //TODO
    }
    
}

