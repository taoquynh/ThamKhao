//
//  JobTypeTableViewCell.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/23/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class JobTypeTableViewCell: UITableViewCell {
  
  let lineView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = hexStringToUIColor(hex: "ECF3F3")
    return view
  }()
  
  let jobTypeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = hexStringToUIColor(hex: "303D3C")
    label.textAlignment = .center
    label.font = .systemFont(ofSize: 14)
    label.layer.borderWidth = 1
    label.layer.cornerRadius = 20
    return label
  }()
  
  let horizontalLineView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = hexStringToUIColor(hex: "ECF3F3")
    return view
  }()
  
  let circleView: CircleView = {
    let view = CircleView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let percentLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .boldSystemFont(ofSize: 16)
    label.textColor = .white
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
    self.addSubview(jobTypeLabel)
    self.addSubview(horizontalLineView)
    self.addSubview(circleView)
    self.addSubview(percentLabel)
  }
  
  func setupLayout() {
    lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    lineView.widthAnchor.constraint(equalToConstant: 3).isActive = true
    lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    
    jobTypeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -16).isActive = true
    jobTypeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    jobTypeLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    jobTypeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6).isActive = true
    
    horizontalLineView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    horizontalLineView.heightAnchor.constraint(equalToConstant: 3).isActive = true
    horizontalLineView.leadingAnchor.constraint(equalTo: lineView.trailingAnchor, constant: 0).isActive = true
    horizontalLineView.trailingAnchor.constraint(equalTo: jobTypeLabel.leadingAnchor, constant: 0).isActive = true
    
    circleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
    circleView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    circleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    circleView.widthAnchor.constraint(equalToConstant: 64).isActive = true
    circleView.heightAnchor.constraint(equalToConstant: 64).isActive = true
    
    percentLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor, constant: 0).isActive = true
    percentLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor, constant: 0).isActive = true
    percentLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    percentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
  }
}
