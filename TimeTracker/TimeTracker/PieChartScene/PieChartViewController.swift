//
//  PieChartViewController.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/22/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class PieChartViewController: UIViewController {
  
  var jobPieChart: [JobPercentage]?
  
  let chartNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Tỷ lệ loại công việc"
    label.textColor = hexStringToUIColor(hex: "808D8D")
    label.font = .boldSystemFont(ofSize: 16)
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
  
  let stateSegmentedControl: StateSegmentedControl = {
    let segmentedControl = StateSegmentedControl(items: ["Trung tâm", "Khối", "Dự Án", "Tất cả"])
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.tintColor = hexStringToUIColor(hex: "66A8FB")
    segmentedControl.selectedSegmentTintColor = hexStringToUIColor(hex: "66A8FB")
    segmentedControl.layer.borderColor = hexStringToUIColor(hex: "66A8FB").cgColor
    segmentedControl.layer.borderWidth = 1
    return segmentedControl
  }()
  
  let pieChartView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let jobTypeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Loại công việc"
    label.font = .boldSystemFont(ofSize: 16)
    label.textColor = hexStringToUIColor(hex: "808D8D")
    return label
  }()
  
  let jobTypeTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.backgroundColor = hexStringToUIColor(hex: "F6F9F9")
    tableView.register(JobTypeTableViewCell.self, forCellReuseIdentifier: "JobTypeCell")
    tableView.separatorStyle = .none
    tableView.alwaysBounceVertical = false
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupData()
    setupView()
    setupLayout()
    setupTableView()
  }
  
  override func viewDidLayoutSubviews() {
    drawPieChart()
  }
  
  func setupView() {
    view.backgroundColor = hexStringToUIColor(hex: "F6F9F9")
    view.addSubview(chartNameLabel)
    view.addSubview(settingImageView)
    view.addSubview(settingLabel)
    view.addSubview(stateSegmentedControl)
    view.addSubview(pieChartView)
    view.addSubview(jobTypeLabel)
    view.addSubview(jobTypeTableView)
  }
  
  func setupLayout() {
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
    
    stateSegmentedControl.topAnchor.constraint(equalTo: settingLabel.bottomAnchor,
                                                  constant: 32).isActive = true
    stateSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    stateSegmentedControl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
    stateSegmentedControl.heightAnchor.constraint(equalToConstant: 24).isActive = true
    
    pieChartView.topAnchor.constraint(equalTo: stateSegmentedControl.bottomAnchor, constant: 32).isActive = true
    pieChartView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    pieChartView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.66).isActive = true
    pieChartView.heightAnchor.constraint(equalTo: pieChartView.widthAnchor, multiplier: 1).isActive = true
    
    jobTypeLabel.topAnchor.constraint(equalTo: pieChartView.bottomAnchor, constant: 32).isActive = true
    jobTypeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    jobTypeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    jobTypeLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 19).isActive = true
    
    jobTypeTableView.topAnchor.constraint(equalTo: jobTypeLabel.bottomAnchor, constant: 8).isActive = true
    jobTypeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    jobTypeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    jobTypeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
  }
  
  func setupData() {
    jobPieChart = [
      JobPercentage(name: "Chính sách chung", percent: 0.38, color: hexStringToUIColor(hex: "49B367")),
      JobPercentage(name: "Chính sách chung", percent: 0.24, color: hexStringToUIColor(hex: "F2B53A")),
      JobPercentage(name: "Chính sách chung", percent: 0.09, color: hexStringToUIColor(hex: "EF6F8F")),
      JobPercentage(name: "Chính sách chung", percent: 0.13, color: hexStringToUIColor(hex: "67A4EC")),
      JobPercentage(name: "Chính sách chung", percent: 0.16, color: hexStringToUIColor(hex: "AC68FF"))
    ]
  }
  
  func drawPieChart() {
    var startPoint: CGFloat = 0
    var endPoint: CGFloat = 0
    for job in jobPieChart! {
      endPoint += CGFloat.pi * 2 * job.percent
      let path = UIBezierPath(arcCenter: CGPoint(x: pieChartView.bounds.midX, y: pieChartView.bounds.midY), radius: pieChartView.bounds.width * 3 / 8, startAngle: startPoint, endAngle: endPoint, clockwise: true)
      let shapeLayer = CAShapeLayer()
      shapeLayer.path = path.cgPath
      shapeLayer.lineWidth = pieChartView.bounds.width / 4
      shapeLayer.strokeColor = job.color.cgColor
      shapeLayer.fillColor = UIColor.clear.cgColor
      pieChartView.layer.addSublayer(shapeLayer)
      startPoint = endPoint
    }
    pieChartView.layer.shadowColor = hexStringToUIColor(hex: "C0D6D2").cgColor
    pieChartView.layer.shadowOffset = CGSize(width: 0, height: 10)
    pieChartView.layer.shadowRadius = 10
    pieChartView.layer.shadowOpacity = 1
  }
  
  func setupTableView() {
    jobTypeTableView.delegate = self
    jobTypeTableView.dataSource = self
  }
  
}

extension PieChartViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return jobPieChart!.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "JobTypeCell", for: indexPath) as! JobTypeTableViewCell
    cell.jobTypeLabel.text = jobPieChart![indexPath.row].name
    cell.jobTypeLabel.layer.borderColor = jobPieChart![indexPath.row].color.cgColor
    cell.circleView.color = jobPieChart![indexPath.row].color
    cell.percentLabel.text = "\(Int(jobPieChart![indexPath.row].percent * 100))%"
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.cellForRow(at: indexPath)?.isSelected = false
  }
}
