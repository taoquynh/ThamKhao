//
//  WeekChartView.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/23/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class WeekChartView: UIView {
  
  var maxHour: Float?  = 10
  
  let timeCountLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.text = "38 giờ làm việc"
    label.font = .boldSystemFont(ofSize: 18)
    label.textColor = hexStringToUIColor(hex: "313E3E")
    return label
  }()
  
  let timeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Tuần từ 18 - 24/11/2019"
    label.font = .boldSystemFont(ofSize: 14)
    label.textColor = hexStringToUIColor(hex: "808D8D")
    return label
  }()
  
  let contentChartCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionview.translatesAutoresizingMaskIntoConstraints = false
    return collectionview
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupView()
    setupLayout()
  }
  
  func setupView() {
    self.addSubview(timeCountLabel)
    self.addSubview(timeLabel)
    self.addSubview(contentChartCollectionView)
  }
  
  func setupLayout() {
    timeCountLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
    timeCountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    timeCountLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    timeCountLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 19).isActive = true
    
    timeLabel.topAnchor.constraint(equalTo: timeCountLabel.bottomAnchor, constant: 6).isActive = true
    timeLabel.leadingAnchor.constraint(equalTo: timeCountLabel.leadingAnchor, constant: 0).isActive = true
    timeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    timeLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    
    contentChartCollectionView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 32).isActive = true
    contentChartCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    contentChartCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    contentChartCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32).isActive = true
    
  }
}
