//
//  TimeSelectionAlert.swift
//  todo
//
//  Created by cuongdd on 10/10/2022.
//

import UIKit

class TimeSelectionAlert: UIViewController {
    
    @IBOutlet weak var coverButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var setButton: UIButton!
    
    open var setButtonPress: ((Date) -> Void)?
    open var maxDateInValib: (() -> Void)?
    open var minDateInValib: (() -> Void)?
    
    open var dateMode: UIDatePicker.Mode = .date {
        didSet {
            if let datePicker = datePicker {
                datePicker.datePickerMode = dateMode
            }
        }
    }
    
    open var selectedDate: Date = Date() {
        didSet {
            if let datePicker = datePicker {
                datePicker.date = selectedDate
            }
        }
    }
    
    open var titleString: String = "" {
        didSet {
            if let titleLabel = titleLabel {
                titleLabel.text = titleString
            }
        }
    }
    
    open var detailString: String = "" {
        didSet {
            if let detailLabel = detailLabel {
                detailLabel.text = detailString
                detailLabel.isHidden = detailString == ""
            }
        }
    }
    
    open var detailColor: UIColor = AppColor.Text.darkText {
        didSet {
            if let detailLabel = detailLabel {
                detailLabel.textColor = detailColor
            }
        }
    }
    
    open var maxDate: Date? {
        didSet {
            //            datePicker.maximumDate = maxDate
        }
    }
    
    open var minDate: Date? {
        didSet {
            //            datePicker.minimumDate = minDate
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
//        NotificationCenter.default.addObserver(self, selector: #selector(handleWhileNetworkStateChange), name: .closePopupNoConnection, object: nil)
//        isMotionEnabled = true
    }
    
    @objc private func handleWhileNetworkStateChange(notification: Notification) {
//        let isConnect = WIFI.isInternetAvailable()
//        if !isConnect {
//            dismissScreenWhileLostConnection()
//        }
    }
    
    deinit {
//        NotificationCenter.default.removeObserver(self, name: .closePopupNoConnection, object: nil)
    }
    
    private func setupUI() {
        dateMode = .dateAndTime
        coverButton.setTitle("", for: .normal)
        datePicker.datePickerMode = dateMode
        datePicker.locale = Locale(identifier: "en_FR")
        datePicker.date = selectedDate
        
        datePicker.preferredDatePickerStyle = .wheels
        titleLabel.font = R.font.playfairDisplayBold(size: 17)
        titleLabel.textColor = AppColor.Text.darkText
        titleLabel.text = titleString
        titleLabel.textAlignment = .center
        
        detailLabel.font = R.font.playfairDisplayRegular(size: 17)
        detailLabel.textColor = detailColor
        detailLabel.text = detailString
        detailLabel.numberOfLines = 0
        detailLabel.textAlignment = .center
        detailLabel.isHidden = true
        
        setupCancelButton()
        setupSetButton()
    }
    
    private func setupCancelButton() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attributes: [NSAttributedString.Key: Any] = [
            .font: R.font.playfairDisplayRegular(size: 17) as Any,
            .foregroundColor: AppColor.Text.darkText,
            .paragraphStyle: paragraphStyle
        ]
        
        let attributedString = NSAttributedString(string: "Cancel", attributes: attributes)
        cancelButton.setAttributedTitle(attributedString, for: .normal)
        cancelButton.layer.cornerRadius = 12
        cancelButton.addTarget(self, action: #selector(cancelButtonAction(sender:)), for: .touchUpInside)
    }
    
    private func setupSetButton() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attributes: [NSAttributedString.Key: Any] = [
            .font: R.font.playfairDisplayRegular(size: 17) as Any,
            .foregroundColor: UIColor.white,
            .paragraphStyle: paragraphStyle
        ]
        let attributedString = NSAttributedString(string: "Set", attributes: attributes)
        setButton.setAttributedTitle(attributedString, for: .normal)
        setButton.layer.cornerRadius = 12
        setButton.backgroundColor = AppColor.Background.normal
        setButton.addTarget(self, action: #selector(setButtonAction(sender:)), for: .touchUpInside)
    }
    
    
    
    @IBAction func tapToDismiss(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

extension TimeSelectionAlert {
    
    @objc fileprivate func cancelButtonAction(sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc fileprivate func setButtonAction(sender: UIButton) {
        setButton.isEnabled = false
        setButtonPress?(datePicker.date)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) { [weak self] in
            self?.setButton.isEnabled = true
        }
        dismiss(animated: true)
    }
    
    func dismissScreenWhileLostConnection() {
        DispatchQueue.main.async {
            self.dismiss(animated: true)
        }
    }
}
