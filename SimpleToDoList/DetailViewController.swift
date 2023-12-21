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

        todoTitleLabelinDetail.text = TodoListViewController.tempToDoTitle
        todoContentsLabelinDetail.text = TodoListViewController.tempToDoContents
        todoTitleLabelinDetail.sizeToFit()
        todoContentsLabelinDetail.sizeToFit()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        todoTitleLabelinDetail.text = ""
        todoContentsLabelinDetail.text = ""
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
