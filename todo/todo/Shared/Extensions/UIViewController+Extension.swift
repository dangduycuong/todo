//
//  UIViewController+Extension.swift
//  todo
//
//  Created by cuongdd on 11/10/2022.
//

import UIKit

//
// MARK: - Default Implementation for Identifier
extension UIViewController: Identifier {
    
    /// ID View
    static var identifierView: String {
        get {
            return String(describing: self)
        }
    }
    
    /// XIB
    static func xib() -> UINib? {
        return UINib(nibName: self.identifierView, bundle: nil)
    }
    
    public func showNavCustom() {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 6
        style.alignment = .center
        let attributes: [NSAttributedString.Key: Any] = [
            .font: R.font.playfairDisplayBold(size: 17) as Any,
            .foregroundColor: UIColor.white,
            .paragraphStyle: style
        ]
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = AppColor.soldierColor
        appearance.titleTextAttributes = attributes
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
}
