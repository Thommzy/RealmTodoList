//
//  ViewController.swift
//  RealmTodoListApps
//
//  Created by Tim on 13/10/2020.
//

import UIKit
import RealmSwift

var todos : Results<Todo>!
var realm = try! Realm()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var todoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todos = realm.objects(Todo.self)
        todoTableView.dataSource = self
        todoTableView.delegate = self
        reload()
        //print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reload()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CallClick" {
            let destination = segue.destination as! InsertViewController
            let todo = todos[todoTableView.indexPathForSelectedRow?.row ?? 0]
            destination.incomingTodo = todo
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        let todo = todos[indexPath.row]
        cell.todoText.text =  todo.todoText
        cell.isDone.text = todo.isDoneText ? "It is Done" : "Do it"
        return cell
    }
    
    func reload() {
        todoTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            try! realm.write {
                realm.delete(todos[indexPath.row])
            }
            reload()
        }
    }
}



