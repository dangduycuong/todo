//
//  TaskModel.swift
//  todo
//
//  Created by cuongdd on 11/10/2022.
//

import Foundation
import RealmSwift

class TaskModel: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var category: String = ""
    @objc dynamic var startDate: String = ""
    
    @objc dynamic var endDate: String = ""
    @objc dynamic var detail: String = ""
    @objc dynamic var isCompleted: Bool = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
}


