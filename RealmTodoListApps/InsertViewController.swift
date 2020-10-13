//
//  InsertViewController.swift
//  RealmTodoListApps
//
//  Created by Tim on 13/10/2020.
//

import UIKit
import RealmSwift

class InsertViewController: UIViewController {
    
    let realm = try! Realm()
    
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var todoSwitch: UISwitch!
    
    @IBAction func saveButtonAction(_ sender: Any) {
        let todo = Todo()
        todo.todoText = todoTextField.text!
        todo.isDoneText = todoSwitch.isOn
        try! self.realm.write {
            self.realm.add(todo)
        }
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

