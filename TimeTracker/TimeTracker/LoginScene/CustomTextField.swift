//
//  CustomTextField.swift
//  RiskTimeTracking
//
//  Created by Hoang Tung on 1/14/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
  
  var cornerRadiusNumber: CGFloat = 20
  
  var textSize: CGFloat = 16
  
  // tạo lề cho phần nhập input
  let padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 20)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.translatesAutoresizingMaskIntoConstraints = false
    self.backgroundColor = .white
    setupLayer()
    setupInputText()
  }
  
  convenience init(placeHolderString string: String) {
    self.init(frame: .zero)
    setupPlaceHolder(string)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupLayer() {
    self.layer.cornerRadius = cornerRadiusNumber
  }
  
  func setupInputText() {
    self.textColor = hexStringToUIColor(hex: "303D3C")
    self.font = .systemFont(ofSize: textSize)
  }
  
  func setupPlaceHolder(_ string: String) {
    let attributedString = NSAttributedString(
      string: NSLocalizedString(string, comment: ""),
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
