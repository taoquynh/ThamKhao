//
//  noteTableViewCell.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/23/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
  
  let lineView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = hexStringToUIColor(hex: "ECF3F3")
    return view
  }()
  
  let pointView: CircleView = {
    let view = CircleView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.color = .systemRed
    return view
  }()
  
  let bigPointView: CircleView = {
    let view = CircleView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.opacity = 0.15
    view.color = .systemRed
    return view
  }()
  
  let warningIconImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "warning")
    return imageView
  }()
  
  let timeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "22/11/2019"
    label.font = .systemFont(ofSize: 14)
    label.textColor = hexStringToUIColor(hex: "B2C0BD")
    return label
  }()
  
  let contentLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.text = "Chưa nhập công việc"
    label.font = .boldSystemFont(ofSize: 16)
    label.textColor = hexStringToUIColor(hex: "313E3E")
    return label
  }()
  
  let updateButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 12
    button.backgroundColor = hexStringToUIColor(hex: "66A8FB")
    button.setTitle("Sửa", for: .normal)
    button.titleLabel!.font = .systemFont(ofSize: 14)
    return button
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
    self.addSubview(warningIconImageView)
    self.addSubview(timeLabel)
    self.addSubview(contentLabel)
    self.addSubview(updateButton)
  }
  
  func setupLayout() {
    lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
    lineView.widthAnchor.constraint(equalToConstant: 3).isActive = true
    lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    
    pointView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    pointView.centerXAnchor.constraint(equalTo: lineView.centerXAnchor, constant: 0).isActive = true
    pointView.widthAnchor.constraint(equalToConstant: 18).isActive = true
    pointView.heightAnchor.constraint(equalToConstant: 18).isActive = true
    
    bigPointView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    bigPointView.centerXAnchor.constraint(equalTo: lineView.centerXAnchor, constant: 0).isActive = true
    bigPointView.widthAnchor.constraint(equalToConstant: 30).isActive = true
    bigPointView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    warningIconImageView.centerXAnchor.constraint(equalTo: pointView.centerXAnchor, constant: 0).isActive = true
    warningIconImageView.centerYAnchor.constraint(equalTo: pointView.centerYAnchor, constant: 0).isActive = true
    warningIconImageView.widthAnchor.constraint(equalTo: pointView.widthAnchor, multiplier: 0.8).isActive = true
    warningIconImageView.heightAnchor.constraint(equalTo: pointView.heightAnchor, multiplier: 0.8).isActive = true
    
    timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
    timeLabel.leadingAnchor.constraint(equalTo: bigPointView.trailingAnchor, constant: 8).isActive = true
    timeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    timeLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 12).isActive = true
    
    contentLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 6).isActive = true
    contentLabel.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: 0).isActive = true
    contentLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
    
    updateButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    updateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    updateButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
    updateButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
  }
  
  
}
