//
//  ViewController.swift
//  todo
//
//  Created by cuongdd on 10/10/2022.
//

import UIKit
import DropDown

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy private var searchView: UIView = {
        let view = SearchView.loadViewFromNib()
        return view
    }()
    
    var viewModel = HomeViewModel()
    private var dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.registerCell(TaskTableViewCell.self)
        
        viewModel.fetchData {
            self.tableView.reloadData()
        }
        addObserver()
    }
    
    private func addObserver() {
        if let searchView = searchView as? SearchView {
            searchView.showFilterOption = {
                self.dropDown.show()
            }
        }
    }
    
    private func setupUI() {
        showNavCustom()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .white
        navigationItem.titleView = searchView
        configurationDropDown()
    }
    
    private func configurationDropDown() {
        DropDown.startListeningToKeyboard()
        DropDown.appearance().textColor = UIColor.black
        DropDown.appearance().selectedTextColor = AppColor.soldierColor
        if let playfairDisplayRegular = R.font.playfairDisplayRegular(size: 17) {
            DropDown.appearance().textFont = playfairDisplayRegular
        }
        DropDown.appearance().backgroundColor = UIColor.white
        DropDown.appearance().selectionBackgroundColor = AppColor.soldierColor
        DropDown.appearance().cellHeight = 64 + 16
        
        dropDown.anchorView = view // UIView or UIBarButtonItem
        dropDown.direction = .bottom
        dropDown.bottomOffset = CGPoint(x: 16, y: tableView.frame.origin.y)
        dropDown.width = UIScreen.main.bounds.width - 32
        
        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = ["Car", "Motorcycle", "Truck"]
        
        /*** IMPORTANT PART FOR CUSTOM CELLS ***/
        dropDown.cellNib = UINib(nibName: "CategoryTableViewCell", bundle: nil)
        
        dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? CategoryTableViewCell else { return }
            cell.optionLabel.text = item
        }
        
        dropDown.selectionAction = { index, item in
            
        }
    }
    
    //MARK: Actions
    @IBAction func selectDate(_ sender: UIButton) {
        guard let vc = R.storyboard.main.addTaskViewController() else {
            return
        }
        vc.addTaskResult = {
            self.viewModel.fetchData {
                self.tableView.reloadData()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listTask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellType: TaskTableViewCell.self, forIndexPath: indexPath)
        cell.fillData(task: viewModel.listTask[indexPath.row])
        return cell
    }
    
    
}
