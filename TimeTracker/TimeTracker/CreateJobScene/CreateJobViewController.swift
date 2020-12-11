//
//  CreateJobViewController.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/25/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class CreateJobViewController: UIViewController {
  
  let titleNavigationLabel: UILabel = {
    let label = UILabel()
    label.text = "Thời gian làm việc"
    label.font = .boldSystemFont(ofSize: 16)
    label.textColor = .white
    label.textAlignment = .center
    return label
  }()
  
  let screenScrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.contentSize = CGSize(width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY * 2)
    return scrollView
  }()
  
  let screenView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = hexStringToUIColor(hex: "F6F9F9")
    return view
  }()
  
  let nameJobLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Tên công việc"
    label.textColor = hexStringToUIColor(hex: "303D3C")
    label.font = .systemFont(ofSize: 16)
    return label
  }()
  
  let nameJobTextField: JobInputTextField = {
    let textField = JobInputTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = "08:30 - Sáng"
    return textField
  }()
  
  let contentLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Nội dung"
    label.textColor = hexStringToUIColor(hex: "303D3C")
    label.font = .systemFont(ofSize: 16)
    return label
  }()
  
  let contentTextField: JobInputTextField = {
    let textField = JobInputTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = ""
    return textField
  }()
  
  let departmentLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Phân loại theo trung tâm"
    label.textColor = hexStringToUIColor(hex: "303D3C")
    label.font = .systemFont(ofSize: 16)
    return label
  }()
  
  let departmentTextField: JobInputTextField = {
    let textField = JobInputTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = ""
    return textField
  }()
  
  let projectLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Phân loại theo dự án"
    label.textColor = hexStringToUIColor(hex: "303D3C")
    label.font = .systemFont(ofSize: 16)
    return label
  }()
  
  let projectTextField: JobInputTextField = {
    let textField = JobInputTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = ""
    return textField
  }()
  
  let divisionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Phân loại theo khối"
    label.textColor = hexStringToUIColor(hex: "303D3C")
    label.font = .systemFont(ofSize: 16)
    return label
  }()
  
  let divisionTextField: JobInputTextField = {
    let textField = JobInputTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = ""
    return textField
  }()
  
  let startTimeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Thời gian bắt đầu"
    label.textColor = hexStringToUIColor(hex: "303D3C")
    label.font = .systemFont(ofSize: 16)
    return label
  }()
  
  let startTimeTextField: JobInputTextField = {
    let textField = JobInputTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = "08:30 - Sáng"
    return textField
  }()
  
  let endTimeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Thời gian kết thúc"
    label.textColor = hexStringToUIColor(hex: "303D3C")
    label.font = .systemFont(ofSize: 16)
    return label
  }()
  
  let endTimeTextField: JobInputTextField = {
    let textField = JobInputTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = "10:15 - Sáng"
    return textField
  }()
  
  let submitButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 8
    button.layer.borderWidth = 1
    button.layer.borderColor = hexStringToUIColor(hex: "F2B53A").cgColor
    button.backgroundColor = hexStringToUIColor(hex: "F2B53A")
    button.setTitle("Hoàn thành", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 16)
    return button
  }()
  
  let cancelButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 8
    button.layer.borderWidth = 1
    button.layer.borderColor = hexStringToUIColor(hex: "303D3C").cgColor
    button.backgroundColor = .clear
    button.setTitle("Thoát", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 16)
    button.setTitleColor(hexStringToUIColor(hex: "303D3C"), for: .normal)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = hexStringToUIColor(hex: "F6F9F9")
    setupNavigation()
    setupView()
    setupLayout()
    setupTextField()
    setupAction()
  }
  
  func setupNavigation() {
    navigationItem.titleView = titleNavigationLabel
    navigationItem.leftBarButtonItem?.tintColor = .white
  }
  
  func setupView() {
    view.addSubview(screenScrollView)
    screenScrollView.addSubview(screenView)
    screenView.addSubview(nameJobLabel)
    screenView.addSubview(nameJobTextField)
    screenView.addSubview(contentLabel)
    screenView.addSubview(contentTextField)
    screenView.addSubview(departmentLabel)
    screenView.addSubview(departmentTextField)
    screenView.addSubview(divisionLabel)
    screenView.addSubview(divisionTextField)
    screenView.addSubview(projectLabel)
    screenView.addSubview(projectTextField)
    screenView.addSubview(startTimeLabel)
    screenView.addSubview(startTimeTextField)
    screenView.addSubview(endTimeLabel)
    screenView.addSubview(endTimeTextField)
    screenView.addSubview(submitButton)
    screenView.addSubview(cancelButton)
  }
  
  func setupLayout() {
    screenScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    screenScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    screenScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    screenScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    
    screenView.topAnchor.constraint(equalTo: screenScrollView.topAnchor, constant: 0).isActive = true
    screenView.leadingAnchor.constraint(equalTo: screenScrollView.leadingAnchor, constant: 0).isActive = true
    screenView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxX).isActive = true
    screenView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxY).isActive = true
    
    nameJobLabel.topAnchor.constraint(equalTo: screenView.topAnchor, constant: 16).isActive = true
    nameJobLabel.leadingAnchor.constraint(equalTo: screenView.leadingAnchor, constant: 32).isActive = true
    nameJobLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    nameJobLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    nameJobTextField.topAnchor.constraint(equalTo: nameJobLabel.bottomAnchor, constant: 8).isActive = true
    nameJobTextField.leadingAnchor.constraint(equalTo: nameJobLabel.leadingAnchor, constant: 0).isActive = true
    nameJobTextField.centerXAnchor.constraint(equalTo: screenView.centerXAnchor, constant: 0).isActive = true
    nameJobTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
    
    contentLabel.topAnchor.constraint(equalTo: nameJobTextField.bottomAnchor, constant: 16).isActive = true
    contentLabel.leadingAnchor.constraint(equalTo: screenView.leadingAnchor, constant: 32).isActive = true
    contentLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    contentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    contentTextField.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 8).isActive = true
    contentTextField.leadingAnchor.constraint(equalTo: contentLabel.leadingAnchor, constant: 0).isActive = true
    contentTextField.centerXAnchor.constraint(equalTo: screenView.centerXAnchor, constant: 0).isActive = true
    contentTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
    
    departmentLabel.topAnchor.constraint(equalTo: contentTextField.bottomAnchor, constant: 16).isActive = true
    departmentLabel.leadingAnchor.constraint(equalTo: screenView.leadingAnchor, constant: 32).isActive = true
    departmentLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    departmentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    departmentTextField.topAnchor.constraint(equalTo: departmentLabel.bottomAnchor, constant: 8).isActive = true
    departmentTextField.leadingAnchor.constraint(equalTo: departmentLabel.leadingAnchor, constant: 0).isActive = true
    departmentTextField.centerXAnchor.constraint(equalTo: screenView.centerXAnchor, constant: 0).isActive = true
    departmentTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
    
    divisionLabel.topAnchor.constraint(equalTo: departmentTextField.bottomAnchor, constant: 16).isActive = true
    divisionLabel.leadingAnchor.constraint(equalTo: screenView.leadingAnchor, constant: 32).isActive = true
    divisionLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    divisionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    divisionTextField.topAnchor.constraint(equalTo: divisionLabel.bottomAnchor, constant: 8).isActive = true
    divisionTextField.leadingAnchor.constraint(equalTo: divisionLabel.leadingAnchor, constant: 0).isActive = true
    divisionTextField.centerXAnchor.constraint(equalTo: screenView.centerXAnchor, constant: 0).isActive = true
    divisionTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
    
    projectLabel.topAnchor.constraint(equalTo: divisionTextField.bottomAnchor, constant: 16).isActive = true
    projectLabel.leadingAnchor.constraint(equalTo: screenView.leadingAnchor, constant: 32).isActive = true
    projectLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    projectLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    projectTextField.topAnchor.constraint(equalTo: projectLabel.bottomAnchor, constant: 8).isActive = true
    projectTextField.leadingAnchor.constraint(equalTo: projectLabel.leadingAnchor, constant: 0).isActive = true
    projectTextField.centerXAnchor.constraint(equalTo: screenView.centerXAnchor, constant: 0).isActive = true
    projectTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
    
    startTimeLabel.topAnchor.constraint(equalTo: projectTextField.bottomAnchor, constant: 16).isActive = true
    startTimeLabel.leadingAnchor.constraint(equalTo: screenView.leadingAnchor, constant: 32).isActive = true
    startTimeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    startTimeLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    startTimeTextField.topAnchor.constraint(equalTo: startTimeLabel.bottomAnchor, constant: 8).isActive = true
    startTimeTextField.leadingAnchor.constraint(equalTo: startTimeLabel.leadingAnchor, constant: 0).isActive = true
    startTimeTextField.centerXAnchor.constraint(equalTo: screenView.centerXAnchor, constant: 0).isActive = true
    startTimeTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
    
    endTimeLabel.topAnchor.constraint(equalTo: startTimeTextField.bottomAnchor, constant: 16).isActive = true
    endTimeLabel.leadingAnchor.constraint(equalTo: screenView.leadingAnchor, constant: 32).isActive = true
    endTimeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    endTimeLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    endTimeTextField.topAnchor.constraint(equalTo: endTimeLabel.bottomAnchor, constant: 8).isActive = true
    endTimeTextField.leadingAnchor.constraint(equalTo: endTimeLabel.leadingAnchor, constant: 0).isActive = true
    endTimeTextField.centerXAnchor.constraint(equalTo: screenView.centerXAnchor, constant: 0).isActive = true
    endTimeTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
    
    cancelButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 16).isActive = true
    cancelButton.leadingAnchor.constraint(equalTo: endTimeTextField.leadingAnchor, constant: 0).isActive = true
    cancelButton.trailingAnchor.constraint(equalTo: endTimeTextField.trailingAnchor, constant: 0).isActive = true
    cancelButton.heightAnchor.constraint(equalTo: endTimeTextField.heightAnchor, multiplier: 1).isActive = true
    cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32).isActive = true
    
    submitButton.topAnchor.constraint(greaterThanOrEqualTo: endTimeTextField.bottomAnchor, constant: 32).isActive = true
    submitButton.leadingAnchor.constraint(equalTo: endTimeTextField.leadingAnchor, constant: 0).isActive = true
    submitButton.trailingAnchor.constraint(equalTo: endTimeTextField.trailingAnchor, constant: 0).isActive = true
    submitButton.heightAnchor.constraint(equalTo: endTimeTextField.heightAnchor, multiplier: 1).isActive = true
  }

  func setupTextField() {
    nameJobTextField.delegate = self
    contentTextField.delegate = self
    departmentTextField.delegate = self
    divisionTextField.delegate = self
    projectTextField.delegate = self
  }
  
  func setupAction() {
    submitButton.addTarget(self, action: #selector(complete), for: .touchUpInside)
    cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
  }
  
  @objc func complete() {
    navigationController?.popViewController(animated: true)
  }
  
  @objc func cancel() {
    navigationController?.popViewController(animated: true)
  }
}

extension CreateJobViewController: UITextFieldDelegate {
  func textFieldDidBeginEditing(_ textField: UITextField) {
    UIView.animate(withDuration: 0.28, animations: {
      textField.layer.cornerRadius = 18
      textField.layer.borderColor = hexStringToUIColor(hex: "3B84F1").cgColor
      textField.layer.borderWidth = 1.5
    })
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    UIView.animate(withDuration: 0.28, animations: {
      textField.layer.cornerRadius = 8
      textField.layer.borderColor = hexStringToUIColor(hex: "303D3C").cgColor
      textField.layer.borderWidth = 0.5
    })
  }
}
