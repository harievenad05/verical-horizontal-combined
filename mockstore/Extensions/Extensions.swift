//
//  Extensions.swift
//  mockstore
//
//  Created by Harie Venad on 13/06/21.
//  Copyright © 2021 Harie. All rights reserved.
//


import Foundation
import UIKit


extension UITextField {
    // Adds Done Btn to Text Field
    func addDoneButton() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done,
                                            target: self, action: #selector(UIView.endEditing(_:)))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        self.inputAccessoryView = keyboardToolbar
    }
    
    // UITextField Styling
    func setStyling(borderWidth:CGFloat,borderColor:UIColor, textName: String, textSize: CGFloat, cornerRadius: CGFloat, mask: Bool, placeHolder: String) -> Void{
        self.placeholder = placeHolder
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = mask
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.autocorrectionType = .no
        self.autocapitalizationType = .sentences
        self.font = UIFont(name: textName, size: textSize)
    }
    // Set Left Padding
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    // Set Right Padding
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func setInputViewDatePicker(target: Any, selector: Selector) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))//1
        datePicker.datePickerMode = .date //2
        self.inputView = datePicker //3
        
        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0)) //4
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) //5
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel)) // 6
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector) //7
        toolBar.setItems([cancel, flexible, barButton], animated: false) //8
        self.inputAccessoryView = toolBar //9
        
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
}

extension UIButton {
    func setButtonStyling(_ title: String, _ cornerRadius: CGFloat, _ mask: Bool, _ bgColor: UIColor, _ titleColor: UIColor, _ titleSize: CGFloat ) -> Void {
        self.setTitle(title, for: UIControl.State.normal)
        self.setTitleColor(titleColor, for: UIControl.State.normal)
        self.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: titleSize)
        self.backgroundColor = bgColor
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = mask
    }
}

extension UIButton {
    func setButtonWithImage(_ title: String, _ cornerRadius: CGFloat, _ mask: Bool, _ bgColor: UIColor, _ titleColor: UIColor, _ titleSize: CGFloat, _ borderColor: CGColor ) -> Void {
        self.setTitle(title, for: UIControl.State.normal)
        self.setTitleColor(titleColor, for: UIControl.State.normal)
        self.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: titleSize)
        self.backgroundColor = bgColor
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = mask
        self.layer.borderWidth = 3.0
        self.layer.borderColor = borderColor
        
    }
}


extension UIView {
    
    func anchorConstraint(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding : UIEdgeInsets = .zero, size: CGSize = .zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    
    
}
