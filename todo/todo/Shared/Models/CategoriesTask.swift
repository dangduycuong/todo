//
//  CategoriesTask.swift
//  todo
//
//  Created by cuongdd on 11/10/2022.
//

import Foundation
import RealmSwift

class CategoriesTask: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
