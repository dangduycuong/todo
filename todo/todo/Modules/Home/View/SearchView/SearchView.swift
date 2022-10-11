//
//  SearchView.swift
//  todo
//
//  Created by cuongdd on 11/10/2022.
//

import UIKit

class SearchView: UIView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var dropDownButon: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    
    var showFilterOption: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        contentView.backgroundColor = AppColor.soldierColor.withAlphaComponent(0.2)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @IBAction func dropDownClicked(_ sender: UIButton) {
        showFilterOption?()
    }
}
