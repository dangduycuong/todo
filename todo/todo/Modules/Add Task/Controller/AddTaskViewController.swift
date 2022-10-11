//
//  AddTaskViewController.swift
//  todo
//
//  Created by cuongdd on 10/10/2022.
//

import UIKit
import DropDown

class AddTaskViewController: BaseViewController {
    @IBOutlet weak var titleTaskTextField: UITextField!
    @IBOutlet weak var categoryTaskTextField: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var deadlineTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var startDateButton: UIButton!
    
    @IBOutlet weak var endDateButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    
    var placeholderLabel: UILabel!
    private var viewModel = AddTaskViewModel()
    var addTaskResult: (() -> ())?
    private var dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        addObserver()
    }
    
    private func addObserver() {
        viewModel.addTaskResult = {
            self.addTaskResult?()
            self.navigationController?.popViewController(animated: true)
        }
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
        addButton.tintColor = AppColor.soldierColor
        
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
        
        dropDown.anchorView = categoryTaskTextField // UIView or UIBarButtonItem
        dropDown.direction = .bottom
        dropDown.bottomOffset = CGPoint(x: 0, y: categoryTaskTextField.bounds.size.height + 8)

        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = ["Car", "Motorcycle", "Truck"]

        /*** IMPORTANT PART FOR CUSTOM CELLS ***/
        dropDown.cellNib = UINib(nibName: "CategoryTableViewCell", bundle: nil)

        dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
           guard let cell = cell as? CategoryTableViewCell else { return }
            cell.optionLabel.text = item
        }
        
        dropDown.selectionAction = { index, item in
            self.categoryTaskTextField.text = item
        }
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
    
    @IBAction func addNewTaskClicked(_ sender: UIButton) {
        viewModel.setupData(title: titleTaskTextField.text, category: categoryTaskTextField.text, startDate: startDateTextField.text, endDate: deadlineTextField.text, detail: descriptionTextView.text)
    }

}

extension AddTaskViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 1 {
            dropDown.show()
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.tag == 1 {
            
        }
    }
}

extension AddTaskViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}
