//
//  CategoryTableViewCell.swift
//  todo
//
//  Created by cuongdd on 11/10/2022.
//

import UIKit
import DropDown

class CategoryTableViewCell: DropDownCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.shadowRadius = 3
    }
    
    private func setupUI() {
        containerView.layer.masksToBounds = true
        containerView.cornerRadius = 8
    }
    
}
