//
//  DetailViewController.swift
//  SimpleToDoList
//
//  Created by 영현 on 12/19/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var todoTitleLabelinDetail: UILabel!
    @IBOutlet weak var todoContentsLabelinDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        todoTitleLabelinDetail.text = TodoListViewController.todoTitleInDetail
        todoContentsLabelinDetail.text = TodoListViewController.todoContentsInDetail
        todoTitleLabelinDetail.sizeToFit()
        todoContentsLabelinDetail.sizeToFit()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        todoTitleLabelinDetail.text = ""
        todoContentsLabelinDetail.text = ""
    }
}
