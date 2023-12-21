//
//  ToDoTableViewCell.swift
//  SimpleToDoList
//
//  Created by 영현 on 12/15/23.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var todoTableTitle: UILabel!
    var todoTableContents: String!
    @IBOutlet weak var isCompletedSwitch: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        isCompletedSwitch.setOn(false, animated: true)
        print(isCompletedSwitch.isOn)
        automaticallyUpdatesContentConfiguration = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func isCompletedChanged(_ sender: Any) {
        print(isCompletedSwitch.isOn)
        // switch가 on 상태일 때, 취소선을 긋는다.
        
        // switch의 상태 변화를 MainViewController.todoList의 isCompleted에 반영하는 기능 필요(미구현)
        
        if isCompletedSwitch.isOn {
            let attributeString = NSMutableAttributedString(string: self.todoTableTitle.text!)
                
            attributeString.addAttribute(.strikethroughStyle,
                                         value: NSUnderlineStyle.single.rawValue,
                                         range: NSMakeRange(0, attributeString.length))
                
            self.todoTableTitle.attributedText = attributeString
        } 

        else {
            let attributeString = NSMutableAttributedString(string: self.todoTableTitle.text!)
            
            attributeString.addAttribute(.strokeWidth,
                                         value: 0,
                                         range: NSMakeRange(0, attributeString.length))
                
            self.todoTableTitle.attributedText = attributeString

        }
    }
}

