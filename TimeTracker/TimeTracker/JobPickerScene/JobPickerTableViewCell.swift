//
//  JobPickerTableViewCell.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/25/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class JobPickerTableViewCell: UITableViewCell {
  
  let containerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 8
    view.layer.borderWidth = 0.25
    view.backgroundColor = .white
    return view
  }()
  
  let colorView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = hexStringToUIColor(hex: "49B393")
    return view
  }()
  
  let nameJobLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Thẩm định hồ sơ"
    label.textColor = hexStringToUIColor(hex: "303D3C")
    label.font = .boldSystemFont(ofSize: 18)
    return label
  }()
  
  let horizontalLineView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = hexStringToUIColor(hex: "D8D8D8")
    return view
  }()
  
  let percentLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "40%"
    label.textColor = hexStringToUIColor(hex: "49B393")
    label.font = .boldSystemFont(ofSize: 32)
    return label
  }()
  
  let verticalLineView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = hexStringToUIColor(hex: "D8D8D8")
    return view
  }()
  
  let startLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Start: 04/12/2019"
    label.textColor = hexStringToUIColor(hex: "808D8D")
    label.font = .systemFont(ofSize: 14)
    return label
  }()
  
  let endLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "End: 12/12/2019"
    label.textColor = hexStringToUIColor(hex: "808D8D")
    label.font = .systemFont(ofSize: 14)
    return label
  }()
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    self.backgroundColor = hexStringToUIColor(hex: "F6F9F9")
    setupView()
    setupLayout()
  }
  
  func setupView() {
    self.addSubview(containerView)
    containerView.insertSubview(colorView, at: 1)
    containerView.addSubview(nameJobLabel)
    containerView.addSubview(horizontalLineView)
    containerView.addSubview(percentLabel)
    containerView.addSubview(verticalLineView)
    containerView.addSubview(startLabel)
    containerView.addSubview(endLabel)
  }
  
  func setupLayout() {
    containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
    containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    
    colorView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
    colorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
    colorView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
    colorView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.036).isActive = true
    
    nameJobLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
    nameJobLabel.leadingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: 32).isActive = true
    nameJobLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
    nameJobLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    horizontalLineView.topAnchor.constraint(equalTo: nameJobLabel.bottomAnchor, constant: 16).isActive = true
    horizontalLineView.leadingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: 16).isActive = true
    horizontalLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    horizontalLineView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
    
    percentLabel.topAnchor.constraint(equalTo: horizontalLineView.bottomAnchor, constant: 12).isActive = true
    percentLabel.leadingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: 16).isActive = true
    percentLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    percentLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16).isActive = true
    
    verticalLineView.topAnchor.constraint(equalTo: horizontalLineView.bottomAnchor, constant: 0).isActive = true
    verticalLineView.leadingAnchor.constraint(equalTo: percentLabel.trailingAnchor, constant: 16).isActive = true
    verticalLineView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8).isActive = true
    verticalLineView.widthAnchor.constraint(equalToConstant: 1).isActive = true
    
    startLabel.topAnchor.constraint(equalTo: horizontalLineView.bottomAnchor, constant: 8).isActive = true
    startLabel.leadingAnchor.constraint(equalTo: verticalLineView.trailingAnchor, constant: 32).isActive = true
    startLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -8).isActive = true
    startLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    endLabel.topAnchor.constraint(equalTo: startLabel.bottomAnchor, constant: 8).isActive = true
    endLabel.leadingAnchor.constraint(equalTo: verticalLineView.trailingAnchor, constant: 32).isActive = true
    endLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -8).isActive = true
    endLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
  }
}
