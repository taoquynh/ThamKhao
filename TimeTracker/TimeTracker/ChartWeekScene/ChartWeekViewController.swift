//
//  ChartWeekViewController.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/22/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class ChartWeekViewController: UIViewController {
  
  let quarterCircleView: QuarterCircleView = {
    let view = QuarterCircleView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let chartNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Thời gian làm việc"
    label.textColor = .white
    label.font = .boldSystemFont(ofSize: 16)
    label.layer.shadowColor = UIColor.black.cgColor
    label.layer.shadowOffset = CGSize(width: 0, height: 0)
    label.layer.shadowRadius = 10
    label.layer.shadowOpacity = 0.3
    return label
  }()
  
  let settingLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Lọc"
    label.font = .boldSystemFont(ofSize: 16)
    label.textColor = hexStringToUIColor(hex: "808D8D")
    return label
  }()
  
  let settingImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "slider")
    return imageView
  }()
  
  let chartView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    view.layer.shadowColor = hexStringToUIColor(hex: "87BDFD").cgColor
    view.layer.shadowOffset = CGSize(width: 0, height: 10)
    view.layer.shadowRadius = 10
    view.layer.shadowOpacity = 0.15
    view.layer.cornerRadius = 8
    view.layer.masksToBounds = false
    return view
  }()
  
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
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.register(WeekChartCollectionViewCell.self, forCellWithReuseIdentifier: "dayCell")
    collectionView.backgroundColor = hexStringToUIColor(hex: "F6F9F9")
    return collectionView
  }()
  
  let noteLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Lưu ý"
    label.font = .boldSystemFont(ofSize: 16)
    label.textColor = hexStringToUIColor(hex: "808D8D")
    return label
  }()
  
  let noteTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.backgroundColor = hexStringToUIColor(hex: "F6F9F9")
    tableView.register(NoteTableViewCell.self, forCellReuseIdentifier: "NoteCell")
    tableView.separatorStyle = .none
    tableView.alwaysBounceVertical = false
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupLayout()
    setupCollectionView()
    setupTableView()
  }
  
  func setupView() {
    view.backgroundColor = hexStringToUIColor(hex: "F6F9F9")
    view.addSubview(quarterCircleView)
    view.addSubview(chartNameLabel)
    view.addSubview(settingImageView)
    view.addSubview(settingLabel)
    view.addSubview(chartView)
    chartView.addSubview(timeCountLabel)
    chartView.addSubview(timeLabel)
    chartView.addSubview(contentChartCollectionView)
    view.addSubview(noteLabel)
    view.addSubview(noteTableView)
  }
  
  func setupLayout() {
    quarterCircleView.topAnchor.constraint(equalTo: view.topAnchor, constant: -90).isActive = true
    quarterCircleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -90).isActive = true
    quarterCircleView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
    quarterCircleView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
    
    chartNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 78).isActive = true
    chartNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21).isActive = true
    chartNameLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    chartNameLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
    
    settingImageView.centerYAnchor.constraint(equalTo: chartNameLabel.centerYAnchor, constant: 0).isActive = true
    settingImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    settingImageView.heightAnchor.constraint(equalToConstant: 26).isActive = true
    settingImageView.widthAnchor.constraint(equalToConstant: 26).isActive = true
    
    settingLabel.centerYAnchor.constraint(equalTo: settingImageView.centerYAnchor, constant: 0).isActive = true
    settingLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
    settingLabel.trailingAnchor.constraint(equalTo: settingImageView.leadingAnchor, constant: -6).isActive = true
    settingLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    chartView.topAnchor.constraint(equalTo: chartNameLabel.bottomAnchor, constant: 42).isActive = true
    chartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    chartView.heightAnchor.constraint(equalTo: chartView.widthAnchor, multiplier: 0.85).isActive = true
    
    timeCountLabel.topAnchor.constraint(equalTo: chartView.topAnchor, constant: 16).isActive = true
    timeCountLabel.leadingAnchor.constraint(equalTo: chartView.leadingAnchor, constant: 16).isActive = true
    timeCountLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    timeCountLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 19).isActive = true
    
    timeLabel.topAnchor.constraint(equalTo: timeCountLabel.bottomAnchor, constant: 6).isActive = true
    timeLabel.leadingAnchor.constraint(equalTo: timeCountLabel.leadingAnchor, constant: 0).isActive = true
    timeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    timeLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    
    contentChartCollectionView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 32).isActive = true
    contentChartCollectionView.leadingAnchor.constraint(equalTo: chartView.leadingAnchor, constant: 16).isActive = true
    contentChartCollectionView.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -32).isActive = true
    contentChartCollectionView.bottomAnchor.constraint(equalTo: chartView.bottomAnchor, constant: -32).isActive = true
    
    noteLabel.topAnchor.constraint(equalTo: contentChartCollectionView.bottomAnchor, constant: 32).isActive = true
    noteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    noteLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    noteLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 19).isActive = true
    
    noteTableView.topAnchor.constraint(equalTo: noteLabel.bottomAnchor, constant: 16).isActive = true
    noteTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    noteTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    noteTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
  }
  
  func setupCollectionView() {
    contentChartCollectionView.dataSource = self
    contentChartCollectionView.delegate = self
  }
  
  func setupTableView() {
    noteTableView.delegate = self
    noteTableView.dataSource = self
  }
}

extension ChartWeekViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 7
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCell", for: indexPath) as! WeekChartCollectionViewCell
    cell.maxHour = 10
    cell.hour = CGFloat.random(in: 7...10)
    return cell
  }
  
  // hàm trả về kích thước của Item
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = ((collectionView.frame.size.width - 1) / 7)
    let height = collectionView.frame.size.height
    return CGSize(width: width, height: height)
  }
  
  // hàm trả về khoảng cách giữa hai hàng
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  // hàm trả về khoảng cách giữa 2 item (tương tự 2 cột)
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}

extension ChartWeekViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as! NoteTableViewCell
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.cellForRow(at: indexPath)?.isSelected = false
  }
}
