//
//  TodoModel.swift
//  RealmTodoListApps
//
//  Created by Tim on 13/10/2020.
//

import Foundation
import RealmSwift

class Todo: Object {
     @objc dynamic var todoText = ""
     @objc dynamic var isDoneText = false
}
