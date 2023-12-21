//
//  ViewController.swift
//  SimpleToDoList
//
//  Created by 영현 on 12/14/23.
//

import UIKit

struct Todo {
    var todoTitle: String
    var todoContents: String
    var isCompleted: Bool
}


class TodoListViewController: UIViewController {

    // 변수 선언 부분
    @IBOutlet var ToDoTableView: UITableView!
    
//    static var todoList: [Todo] = [Todo(todoTitle: "sample 1", todoContents: "sample 1" ,isCompleted: false),
//                                   Todo(todoTitle: "sample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contents", todoContents: "sample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contentssample 2 contents" ,isCompleted: false),
//                                   Todo(todoTitle: "sample 3", todoContents: "sample 3 contentssample 3 contentssample 3 contentssample 3 contentssample 3 contentssample 3 contentssample 3 contentssample 3 contentssample 3 contentssample 3 contentssample 3 contentssample 3 contentssample 3 contentssample 3 contentssample 3 contents" ,isCompleted: false)]
    static var todoList: [Todo] = []
    
    static var tempToDoTitle = String()
    static var tempToDoContents = String()
    
    // 함수 선언 부분
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(#function,"todolistviewcontroller")
        // Do any additional setup after loading the view.
        ToDoTableView.delegate = self
        ToDoTableView.dataSource = self
        ToDoTableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
//        print(#function,"todolistviewcomtroller")
        super.viewWillAppear(animated)
        
        ToDoTableView.reloadData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        ToDoTableView.reloadData()
    }
    
}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoListViewController.todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ToDoTableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoTableViewCell
        
        cell.todoTableTitle.text = TodoListViewController.todoList[indexPath.row].todoTitle
        cell.todoTableContents = TodoListViewController.todoList[indexPath.row].todoContents
        cell.isCompletedSwitch.isOn = TodoListViewController.todoList[indexPath.row].isCompleted
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
//        print("tableview cell selected!")
//        print(indexPath)

        TodoListViewController.tempToDoTitle = TodoListViewController.todoList[indexPath.row].todoTitle
        TodoListViewController.tempToDoContents = TodoListViewController.todoList[indexPath.row].todoContents
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            TodoListViewController.todoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}

