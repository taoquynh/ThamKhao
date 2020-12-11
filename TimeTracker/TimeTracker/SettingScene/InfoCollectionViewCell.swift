//
//  InfoCollectionViewCell.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/24/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class InfoCollectionViewCell: UICollectionViewCell {
  
  let leftLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .boldSystemFont(ofSize: 16)
    label.textColor = hexStringToUIColor(hex: "303D3C")
    return label
  }()
  
  let rightLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .right
    label.textColor = hexStringToUIColor(hex: "303D3C")
    label.font = .systemFont(ofSize: 16)
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .clear
    setupView()
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupView() {
    self.addSubview(leftLabel)
    self.addSubview(rightLabel)
  }
  
  func setupLayout() {
    leftLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
    leftLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    leftLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    leftLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
    
    rightLabel.topAnchor.constraint(equalTo: leftLabel.topAnchor).isActive = true
    rightLabel.bottomAnchor.constraint(equalTo: leftLabel.bottomAnchor).isActive = true
    rightLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    rightLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
  }
}
