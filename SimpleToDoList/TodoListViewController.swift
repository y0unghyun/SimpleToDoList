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
    static var todoList: [Todo] = [Todo(todoTitle: "11", todoContents: "11111", isCompleted: true)]
    static var todoTitleInDetail = String()
    static var todoContentsInDetail = String()
    static var tempIsCompleted: Bool?
    
    // 함수 선언 부분
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ToDoTableView.delegate = self
        ToDoTableView.dataSource = self
        ToDoTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
        
        cell.setCell(TodoListViewController.todoList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        TodoListViewController.todoTitleInDetail = TodoListViewController.todoList[indexPath.row].todoTitle
        TodoListViewController.todoContentsInDetail = TodoListViewController.todoList[indexPath.row].todoContents
        
        if let ic = TodoListViewController.tempIsCompleted {
            TodoListViewController.todoList[indexPath.row].isCompleted = ic
        }
        print(TodoListViewController.todoList[indexPath.row].isCompleted)
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

