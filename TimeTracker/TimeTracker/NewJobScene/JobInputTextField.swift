//
//  JobInputTextField.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/25/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class JobInputTextField: UITextField {
  
  var textSize: CGFloat = 16
  
  // tạo lề cho phần nhập input
  let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    setupPlaceHolder(placeholder)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup() {
    self.backgroundColor = hexStringToUIColor(hex: "F6F9F9")
    self.layer.cornerRadius = 8
    self.layer.borderColor = hexStringToUIColor(hex: "303D3C").cgColor
    self.layer.borderWidth = 0.5
  }
  
  func setupPlaceHolder(_ string: String?) {
    let attributedString = NSAttributedString(
      string: NSLocalizedString(string ?? "", comment: ""),
      attributes:[
        NSAttributedString.Key.font : UIFont.italicSystemFont(ofSize: textSize),
        NSAttributedString.Key.foregroundColor : hexStringToUIColor(hex: "C3C8D0"),
      ]
    )
    self.attributedPlaceholder = attributedString
  }
  
  // MARK: thiết lập khoảng cách giữa ký tự nhập và viền của textField
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }

}
