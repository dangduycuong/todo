//
//  AddTaskViewModel.swift
//  todo
//
//  Created by cuongdd on 11/10/2022.
//

import Foundation

class AddTaskViewModel {
    var newTask = TaskModel()
    var addTaskResult: (() -> ())?
    
    private func validateTask(title: String?) -> Bool {
        if title == nil || title == "" {
            return false
        }
        return true
    }
    
    func setupData(title: String?, category: String?, startDate: String?, endDate: String?, detail: String?) {
        if validateTask(title: title) {
            if let id = UserDefaultManager.getDataLocal(key: LocalKey.id.rawValue) {
                let idTask = (Int(id) ?? 0) + 1
                newTask.id = "\(idTask)"
                UserDefaultManager.saveToLocal(value: "\(idTask)", key: LocalKey.id.rawValue)
            } else {
                newTask.id = "1"
                UserDefaultManager.saveToLocal(value: "1", key: LocalKey.id.rawValue)
            }
            newTask.title = title ?? ""
            newTask.category = category ?? ""
            newTask.startDate = startDate ?? ""
            newTask.endDate = endDate ?? ""
            newTask.detail = detail ?? ""
            newTask.isCompleted = false
            DataBaseManager.shared.addTask(task: newTask)
            addTaskResult?()
        }
    }
}
