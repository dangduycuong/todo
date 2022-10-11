//
//  AddTaskViewController.swift
//  todo
//
//  Created by cuongdd on 10/10/2022.
//

import UIKit

class AddTaskViewController: BaseViewController {
    @IBOutlet weak var titleTaskTextField: UITextField!
    @IBOutlet weak var categoryTaskTextField: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var deadlineTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var startDateButton: UIButton!
    
    @IBOutlet weak var endDateButton: UIButton!
    
    
    
    var placeholderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        let style = NSMutableParagraphStyle()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: R.font.playfairDisplayRegular(size: 17) as Any,
            .foregroundColor: AppColor.Text.darkText,
            .paragraphStyle: style
        ]
        titleTaskTextField.attributedPlaceholder = NSAttributedString(string: "Tiêu đề", attributes: attributes)
        categoryTaskTextField.attributedPlaceholder = NSAttributedString(string: "Loại công việc", attributes: attributes)
        startDateTextField.attributedPlaceholder = NSAttributedString(string: "Ngày bắt đầu", attributes: attributes)
        deadlineTextField.attributedPlaceholder = NSAttributedString(string: "Ngày kết thúc", attributes: attributes)
        
        placeholderLabel = UILabel()
        placeholderLabel.text = "Enter some text..."
        placeholderLabel.font = R.font.playfairDisplayItalic(size: 17)
        placeholderLabel.sizeToFit()
        descriptionTextView.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (descriptionTextView.font?.pointSize)! / 2)
        placeholderLabel.textColor = .tertiaryLabel
        placeholderLabel.isHidden = !descriptionTextView.text.isEmpty
        
        startDateButton.setTitle("", for: .normal)
        endDateButton.setTitle("", for: .normal)
        title = "Thêm công việc"
    }
    
    private func selectStartDate() {
        guard let dateVC = R.storyboard.date.timeSelectionAlert() else {
            return
        }
        dateVC.modalPresentationStyle = .overFullScreen
        dateVC.modalTransitionStyle = .crossDissolve
        dateVC.titleString = "Chọn ngày bắt đầu"
        dateVC.detailString = "Detail"
        //        dateVC.dateMode = .dateAndTime
        dateVC.selectedDate = Date()
        dateVC.setButtonPress = { [weak self] date in
            //            self?.viewModel?.updateArrivalTime(byDate: date)
            guard let `self` = self else {
                return
            }
            self.startDateTextField.text = date.convertToString(format: "yyyy-MM-dd HH:mm:ss x") ?? ""
        }
        dateVC.maxDate = Date()
        dateVC.minDate = nil
        dateVC.detailColor = .red
        present(dateVC, animated: true)
    }
    
    private func selectEndDate() {
        guard let dateVC = R.storyboard.date.timeSelectionAlert() else {
            return
        }
        dateVC.modalPresentationStyle = .overFullScreen
        dateVC.modalTransitionStyle = .crossDissolve
        dateVC.titleString = "Chọn ngày hoàn thành"
        dateVC.detailString = "Detail"
        //        dateVC.dateMode = .dateAndTime
        dateVC.selectedDate = Date()
        dateVC.setButtonPress = { [weak self] date in
            //            self?.viewModel?.updateArrivalTime(byDate: date)
            guard let `self` = self else {
                return
            }
            self.deadlineTextField.text = date.convertToString(format: "yyyy-MM-dd HH:mm:ss x") ?? ""
        }
        dateVC.maxDate = Date()
        dateVC.minDate = nil
        dateVC.detailColor = .red
        present(dateVC, animated: true)
    }
    
    @IBAction func selectDateClicked(_ sender: UIButton) {
        if sender.tag == 0 {
            selectStartDate()
        } else {
            selectEndDate()
        }
    }

}

extension AddTaskViewController: UITextFieldDelegate {
}

extension AddTaskViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}
