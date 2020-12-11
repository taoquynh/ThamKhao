//
//  ReviewCollectionViewCell.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/21/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class ReviewCollectionViewCell: UICollectionViewCell {
  
  var percentage: Float?
  
  let containerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let percentageView: PercentageCircleView = {
    let view = PercentageCircleView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let hourLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "173 giờ"
    label.font = .boldSystemFont(ofSize: 18)
    label.textColor = hexStringToUIColor(hex: "303D3C")
    return label
  }()
  
  let classifyLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "theo Khối"
    label.font = .systemFont(ofSize: 13)
    label.textColor = hexStringToUIColor(hex: "828F8F")
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    setupLayout()
    percentageView.percentage = percentage
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupView() {
    self.addSubview(containerView)
    containerView.addSubview(percentageView)
    
    containerView.addSubview(hourLabel)
    containerView.addSubview(classifyLabel)
  }
  
  func setupLayout() {
    containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
    containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    containerView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7365).isActive = true
    containerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3673).isActive = true
    
    percentageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
    percentageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
    percentageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1).isActive = true
    percentageView.widthAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1).isActive = true
    
    hourLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
    hourLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
    hourLabel.leadingAnchor.constraint(equalTo: percentageView.trailingAnchor, constant: 8).isActive = true
    hourLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.6).isActive = true
    
    classifyLabel.topAnchor.constraint(equalTo: hourLabel.bottomAnchor, constant: 8).isActive = true
    classifyLabel.leadingAnchor.constraint(equalTo: percentageView.trailingAnchor, constant: 8).isActive = true
    classifyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
    classifyLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
  }
}
