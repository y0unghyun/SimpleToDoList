//
//  ToDoTableViewCell.swift
//  SimpleToDoList
//
//  Created by 영현 on 12/15/23.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var todoTableTitle: UILabel!
    var todoTableContents: String!
    @IBOutlet weak var isCompletedSwitch: UISwitch!
    
    var todo: Todo?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        automaticallyUpdatesContentConfiguration = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func isCompletedChanged(_ sender: Any) {
        guard let todo else { return }
        if isCompletedSwitch.isOn {
            todoTableTitle?.attributedText = todo.todoTitle.strikeThrough()
        } else {
            todoTableTitle?.attributedText = todo.todoTitle.nonStrikeThrough()
        }
        TodoListViewController.tempIsCompleted = isCompletedSwitch.isOn
    }
    
    func setCell(_ _todo: Todo) {
        todo = _todo
        guard let todo else { return }
        if todo.isCompleted  {
            todoTableTitle?.attributedText = todo.todoTitle.strikeThrough()
//            todo.isCompleted = true
        } else {
            todoTableTitle?.attributedText = todo.todoTitle.nonStrikeThrough()
//            todo.isCompleted = false
        }
        isCompletedSwitch.isOn = todo.isCompleted
    }
}

