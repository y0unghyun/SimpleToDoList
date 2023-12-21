//
//  AddTodoViewController.swift
//  SimpleToDoList
//
//  Created by 영현 on 12/15/23.
//

import UIKit

class AddTodoViewController: UIViewController {

    @IBOutlet weak var todoContents: UITextField!
    @IBOutlet weak var todoTitle: UITextField!
    
    override func viewDidLoad() {
//        print(#function,"addtodoviewcontroller")
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didAddToDoButtonTapped(_ sender: Any) {
        
        // 제목이나 내용 TextField가 비었을 때 나올 Alert 컨트롤러 객체 생성
        let missingTitleAlert = UIAlertController(title: "내용이 모두 입력되지 않았습니다.", message: "빈 칸이 있는지 확인하십시오.", preferredStyle: UIAlertController.Style.alert)
        // 정말 추가할 것인지 확인할 때 나올 Alert 컨트롤러 객체 생성
        let sureToAddAlert = UIAlertController(title: "할 일 추가", message: "위 내용을 추가하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        // Alert 액션 객체 생성
        let addAction = UIAlertAction(title: "추가", style: UIAlertAction.Style.default){ _ in
            print("count: \(TodoListViewController.todoList.count)")
            TodoListViewController.todoList.append(Todo(todoTitle: self.todoTitle.text!, todoContents: self.todoContents.text! ,isCompleted: false))
            self.todoTitle.text = ""
            self.todoContents.text = ""
            print("count: \(TodoListViewController.todoList.count)")
            
            self.navigationController?.popViewController(animated: true)
        }
        let confirmAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel)
        
        // Alert 컨트롤러에 버튼 추가
        missingTitleAlert.addAction(confirmAction)
        sureToAddAlert.addAction(addAction)
        sureToAddAlert.addAction(cancelAction)
        
        if self.todoTitle.text == "" || self.todoContents.text == "" {
            self.present(missingTitleAlert, animated: true)
        } else {
            self.present(sureToAddAlert, animated: true)
        }
    }
}
