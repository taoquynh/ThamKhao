//
//  JobPickerViewController.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/25/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class JobPickerViewController: UIViewController {
  
  var jobPickerData: [JobPicker]?
  
  let titleNavigationLabel: UILabel = {
    let label = UILabel()
    label.text = "Thời gian làm việc"
    label.font = .boldSystemFont(ofSize: 16)
    label.textColor = .white
    label.textAlignment = .center
    return label
  }()
  
  let jobTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(JobPickerTableViewCell.self, forCellReuseIdentifier: "JobPickerCell")
    tableView.separatorStyle = .none
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupData()
    setupNavigation()
    setupView()
    setupLayout()
    setupTableView()
  }
  
  func setupData() {
    jobPickerData = [
      JobPicker(name: "Thẩm định hồ sơ", percent: "40%", color: hexStringToUIColor(hex: "EF6F8F"), start: "Start: 04/12/2019", end: "End: 12/12/2019"),
      JobPicker(name: "Thẩm định hồ sơ", percent: "40%", color: hexStringToUIColor(hex: "49B393"), start: "Start: 04/12/2019", end: "End: 12/12/2019"),
      JobPicker(name: "Thẩm định hồ sơ", percent: "40%", color: hexStringToUIColor(hex: "F19E5E"), start: "Start: 04/12/2019", end: "End: 12/12/2019"),
      JobPicker(name: "Thẩm định hồ sơ", percent: "40%", color: hexStringToUIColor(hex: "AC68FF"), start: "Start: 04/12/2019", end: "End: 12/12/2019"),
      JobPicker(name: "Thẩm định hồ sơ", percent: "40%", color: hexStringToUIColor(hex: "EF6F8F"), start: "Start: 04/12/2019", end: "End: 12/12/2019"),
      JobPicker(name: "Thẩm định hồ sơ", percent: "40%", color: hexStringToUIColor(hex: "49B393"), start: "Start: 04/12/2019", end: "End: 12/12/2019"),
      JobPicker(name: "Thẩm định hồ sơ", percent: "40%", color: hexStringToUIColor(hex: "F19E5E"), start: "Start: 04/12/2019", end: "End: 12/12/2019")
    ]
  }
  
  func setupNavigation() {
    navigationController?.navigationBar.barTintColor = hexStringToUIColor(hex: "66A8FB")
    navigationItem.titleView = titleNavigationLabel
    
    let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createJob))
    rightButton.tintColor = .white
    navigationItem.rightBarButtonItem = rightButton
    
    let leftButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(cancel))
    leftButton.tintColor = .white
    navigationItem.leftBarButtonItem = leftButton
  }
  
  @objc func createJob() {
    let destinationVC = CreateJobViewController()
    navigationController?.modalPresentationStyle = .overFullScreen
    navigationController?.pushViewController(destinationVC, animated: true)
  }
  
  @objc func cancel() {
    navigationController?.dismiss(animated: true, completion: {})
  }
  
  func setupView() {
    view.addSubview(jobTableView)
  }
  
  func setupLayout() {
    jobTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    jobTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    jobTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    jobTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
  }
  
  func setupTableView() {
    jobTableView.delegate = self
    jobTableView.dataSource = self
  }
  
  
}

extension JobPickerViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return jobPickerData!.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "JobPickerCell", for: indexPath) as! JobPickerTableViewCell
    cell.separatorInset = UIEdgeInsets.zero
    cell.layoutMargins = UIEdgeInsets.zero
    
    cell.nameJobLabel.text = jobPickerData![indexPath.row].name
    cell.colorView.backgroundColor = jobPickerData![indexPath.row].color
    cell.percentLabel.text = jobPickerData![indexPath.row].percent
    cell.startLabel.text = jobPickerData![indexPath.row].start
    cell.endLabel.text = jobPickerData![indexPath.row].end
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.cellForRow(at: indexPath)?.isSelected = false
    let destinationVC = NewJobViewController()
    navigationController?.pushViewController(destinationVC, animated: true)
    let cell = tableView.cellForRow(at: indexPath) as! JobPickerTableViewCell
    navigationItem.title = cell.nameJobLabel.text
  }
}
