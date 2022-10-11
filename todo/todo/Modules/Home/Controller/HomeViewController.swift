//
//  ViewController.swift
//  todo
//
//  Created by cuongdd on 10/10/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        showNavCustom()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .white
    }
    
    @IBAction func selectDate(_ sender: UIButton) {
        guard let vc = R.storyboard.main.addTaskViewController() else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

