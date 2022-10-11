//
//  HomeViewModel.swift
//  todo
//
//  Created by cuongdd on 11/10/2022.
//

import Foundation

class HomeViewModel {
    var listTask = [TaskModel]()
    
    func fetchData(completeion: @escaping(() -> ())) {
        DataBaseManager.shared.loadListTask { [weak self] tasks in
            guard let `self` = self else {
                return
            }
            self.listTask = tasks
            completeion()
        }
    }
}
