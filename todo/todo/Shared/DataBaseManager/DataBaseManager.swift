//
//  DataBaseManager.swift
//  todo
//
//  Created by cuongdd on 11/10/2022.
//

import Foundation
import RealmSwift

class DataBaseManager: NSObject {
    static let shared: DataBaseManager = DataBaseManager()
    let realm = try! Realm()
    
    func addTask(task: TaskModel) {
        let newTask = TaskModel()
        newTask.id = task.id
        newTask.title = task.title
        newTask.category = task.category
        newTask.startDate = task.startDate
        newTask.endDate = task.endDate
        newTask.detail = task.detail
        newTask.isCompleted = task.isCompleted
        
        try! realm.write {
            realm.add(newTask)
        }
    }
    
    func modifyTask(taskEdit: TaskModel) {
        let tasks = realm.objects(TaskModel.self)
        realm.beginWrite()
        for task in tasks {
            if task.id == taskEdit.id {
                task.title = taskEdit.title
                task.category = taskEdit.category
                task.startDate = taskEdit.startDate
                task.endDate = taskEdit.endDate
                task.detail = taskEdit.detail
                task.isCompleted = taskEdit.isCompleted
                break
            }
        }
        try! realm.commitWrite()
    }
    
    func deleteTask(taskForDeleta: TaskModel) {
        guard let taskItem = realm.objects(TaskModel.self).filter({ $0.id == taskForDeleta.id }).first else {
            return
        }
        try! realm.write {
            realm.delete(taskItem)
        }
    }
    
    func loadListTask(completion: @escaping(([TaskModel]) -> ())) {
        let list = realm.objects(TaskModel.self)
        var tasks = [TaskModel]()
        list.forEach { item in
            tasks.append(item)
        }
        completion(tasks)
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        return array
    }
}

enum LocalKey: String {
    case id
}

class UserDefaultManager {
    class func saveToLocal(value: String, key: String) {
        UserDefaults.standard.setValue(value, forKey: key)
    }
    
    class func getDataLocal(key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
    class func removeDataLocal(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
