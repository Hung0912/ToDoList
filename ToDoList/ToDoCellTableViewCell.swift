//
//  ToDoCellTableViewCell.swift
//  ToDoList
//
//  Created by Bảo  Hưng on 6/25/19.
//  Copyright © 2019 Bảo  Hưng. All rights reserved.
//

import UIKit

class ToDoCellTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var todoTitleLbl: UILabel!
    @IBOutlet weak var checkBox: UIButton!
    
    @IBAction func checkBoxTapped(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
        }else{
            sender.isSelected = true
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        checkBox.isEnabled = true
        checkBox.setImage(UIImage(named: "uncheck_icon"), for: .normal)
        checkBox.setImage(UIImage(named: "checked_icon"), for: .selected)
    }


}
