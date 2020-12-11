//
//  WeekChartCollectionViewCell.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/23/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class WeekChartCollectionViewCell: UICollectionViewCell {
  
  var hour: CGFloat?
  var maxHour: CGFloat?
  
  let eightLineView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = hexStringToUIColor(hex: "C3C3C3")
    return view
  }()
  
  let fourLineView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = hexStringToUIColor(hex: "C3C3C3")
    return view
  }()
  
  let zeroLineView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = hexStringToUIColor(hex: "C3C3C3")
    return view
  }()
  
  let hourView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 8
    view.backgroundColor = hexStringToUIColor(hex: "66A8FB")
    let gradient = CAGradientLayer()
    gradient.colors = [hexStringToUIColor(hex: "66A8FB").cgColor, hexStringToUIColor(hex: "3B84F1").cgColor]
    gradient.locations = [0.0, 1.0]
    gradient.frame = view.bounds
    view.layer.addSublayer(gradient)
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    setupView()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupView() {
    self.addSubview(eightLineView)
    self.addSubview(fourLineView)
    self.addSubview(zeroLineView)
    self.addSubview(hourView)
  }
  
  func setupLayout() {
    let height = self.bounds.height
    eightLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(height / maxHour! * 8)).isActive = true
    eightLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    eightLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    eightLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    
    fourLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(height / maxHour! * 4)).isActive = true
    fourLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    fourLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    fourLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    
    zeroLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    zeroLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    zeroLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    zeroLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    
    hourView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    hourView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
    hourView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6).isActive = true
    hourView.heightAnchor.constraint(equalToConstant: height / self.maxHour! * self.hour!).isActive = true
  }
}
