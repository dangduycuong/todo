//
//  TaskTableViewCell.swift
//  todo
//
//  Created by cuongdd on 11/10/2022.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var completedImageView: UIImageView!
    @IBOutlet weak var completedButton: UIButton!
    @IBOutlet weak var titleTaskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.shadowRadius = 3
    }
    
    private func setupUI() {
        containerView.layer.masksToBounds = true
        containerView.cornerRadius = 8
    }
    
    func fillData(task: TaskModel) {
        titleTaskLabel.text = task.title
        completedImageView.image = task.isCompleted ? R.image.checkIcon() : R.image.uncheck()
    }
    
    @IBAction func completedButtonClicked(_ sender: UIButton) {
    }
}
