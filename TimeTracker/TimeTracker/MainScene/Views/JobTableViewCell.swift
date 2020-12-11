//
//  JobTableViewCell.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/21/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class JobTableViewCell: UITableViewCell {
  
  let lineView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = hexStringToUIColor(hex: "ECF3F3")
    return view
  }()
  
  let pointView: CircleView = {
    let view = CircleView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let bigPointView: CircleView = {
    let view = CircleView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.opacity = 0.15
    return view
  }()
  
  let classifyLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Dự án"
    label.font = .systemFont(ofSize: 12)
    label.textColor = hexStringToUIColor(hex: "B2C0BD")
    return label
  }()
  
  let nameJobLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.text = "Triển khai dự Án BCDE"
    label.font = .boldSystemFont(ofSize: 16)
    label.textColor = hexStringToUIColor(hex: "313E3E")
    return label
  }()
  
  let timeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "03/12/2019 - 31/12/2019"
    label.font = .systemFont(ofSize: 12)
    label.textColor = hexStringToUIColor(hex: "B2C0BD")
    return label
  }()
  
  let addButton: CircleButton = {
    let button = CircleButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 15
    return button
  }()
  
  let percentageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "40%"
    label.font = .boldSystemFont(ofSize: 18)
    label.textColor = hexStringToUIColor(hex: "66A8FB")
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
    self.addSubview(lineView)
    self.addSubview(pointView)
    self.addSubview(bigPointView)
    self.addSubview(classifyLabel)
    self.addSubview(nameJobLabel)
    self.addSubview(timeLabel)
    self.addSubview(addButton)
    self.addSubview(percentageLabel)
  }
  
  func setupLayout() {
    lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
    lineView.widthAnchor.constraint(equalToConstant: 3).isActive = true
    lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    
    pointView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    pointView.centerXAnchor.constraint(equalTo: lineView.centerXAnchor, constant: 0).isActive = true
    pointView.widthAnchor.constraint(equalToConstant: 10).isActive = true
    pointView.heightAnchor.constraint(equalToConstant: 10).isActive = true
    
    bigPointView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    bigPointView.centerXAnchor.constraint(equalTo: lineView.centerXAnchor, constant: 0).isActive = true
    bigPointView.widthAnchor.constraint(equalToConstant: 30).isActive = true
    bigPointView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    classifyLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
    classifyLabel.leadingAnchor.constraint(equalTo: bigPointView.trailingAnchor, constant: 8).isActive = true
    classifyLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    classifyLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 12).isActive = true
    
    nameJobLabel.topAnchor.constraint(equalTo: classifyLabel.bottomAnchor, constant: 8).isActive = true
    nameJobLabel.leadingAnchor.constraint(equalTo: classifyLabel.leadingAnchor, constant: 0).isActive = true
    nameJobLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    nameJobLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    
    timeLabel.topAnchor.constraint(equalTo: nameJobLabel.bottomAnchor, constant: 8).isActive = true
    timeLabel.leadingAnchor.constraint(equalTo: nameJobLabel.leadingAnchor, constant: 0).isActive = true
    timeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    timeLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 12).isActive = true
    timeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    
    addButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    addButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
    addButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    percentageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    percentageLabel.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -8).isActive = true
    percentageLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
    percentageLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
  }
  
}
