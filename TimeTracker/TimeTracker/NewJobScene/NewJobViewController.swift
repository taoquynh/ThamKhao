//
//  NewJobViewController.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/24/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class NewJobViewController: UIViewController {
  
  let titleNavigationLabel: UILabel = {
    let label = UILabel()
    label.text = "Thời gian làm việc"
    label.font = .boldSystemFont(ofSize: 16)
    label.textColor = .white
    label.textAlignment = .center
    return label
  }()
  
  let sceneScrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.backgroundColor = hexStringToUIColor(hex: "F6F9F9")
    scrollView.contentSize = CGSize(width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY * 2)
    return scrollView
  }()
  
  let sceneView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = hexStringToUIColor(hex: "F6F9F9")
    return view
  }()
  
  let dateTextField: JobInputTextField = {
    let textField = JobInputTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = "Thứ ba, ngày 07/01/2020"
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
    textField.placeholder = "chi tiết công việc"
    return textField
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
    textField.placeholder = "Thẩm định hồ sơ"
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
  }
  
  func setupNavigation() {
    navigationController?.navigationBar.barTintColor = hexStringToUIColor(hex: "66A8FB")
    navigationItem.titleView = titleNavigationLabel
  }
  
  func setupView() {
    view.addSubview(sceneScrollView)
    sceneScrollView.addSubview(sceneView)
    sceneView.addSubview(dateTextField)
    sceneView.addSubview(startTimeLabel)
    sceneView.addSubview(startTimeTextField)
    sceneView.addSubview(endTimeLabel)
    sceneView.addSubview(endTimeTextField)
    sceneView.addSubview(contentLabel)
    sceneView.addSubview(contentTextField)
    sceneView.addSubview(nameJobLabel)
    sceneView.addSubview(nameJobTextField)
    sceneView.addSubview(submitButton)
    sceneView.addSubview(cancelButton)
  }
  
  func setupLayout() {
    sceneScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    sceneScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    sceneScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    sceneScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    
    sceneView.topAnchor.constraint(equalTo: sceneScrollView.topAnchor, constant: 0).isActive = true
    sceneView.leadingAnchor.constraint(equalTo: sceneScrollView.leadingAnchor, constant: 0).isActive = true
    sceneView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxX).isActive = true
    sceneView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxY).isActive = true
    
    dateTextField.topAnchor.constraint(equalTo: sceneView.topAnchor, constant: 24).isActive = true
    dateTextField.centerXAnchor.constraint(equalTo: sceneView.centerXAnchor, constant: 0).isActive = true
    dateTextField.leadingAnchor.constraint(equalTo: sceneView.leadingAnchor, constant: 32).isActive = true
    dateTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
    
    startTimeLabel.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 16).isActive = true
    startTimeLabel.leadingAnchor.constraint(equalTo: dateTextField.leadingAnchor, constant: 0).isActive = true
    startTimeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    startTimeLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    startTimeTextField.topAnchor.constraint(equalTo: startTimeLabel.bottomAnchor, constant: 8).isActive = true
    startTimeTextField.leadingAnchor.constraint(equalTo: dateTextField.leadingAnchor, constant: 0).isActive = true
    startTimeTextField.trailingAnchor.constraint(equalTo: dateTextField.trailingAnchor, constant: 0).isActive = true
    startTimeTextField.heightAnchor.constraint(equalTo: dateTextField.heightAnchor, multiplier: 1).isActive = true
    
    endTimeLabel.topAnchor.constraint(equalTo: startTimeTextField.bottomAnchor, constant: 16).isActive = true
    endTimeLabel.leadingAnchor.constraint(equalTo: dateTextField.leadingAnchor, constant: 0).isActive = true
    endTimeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    endTimeLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    endTimeTextField.topAnchor.constraint(equalTo: endTimeLabel.bottomAnchor, constant: 8).isActive = true
    endTimeTextField.leadingAnchor.constraint(equalTo: dateTextField.leadingAnchor, constant: 0).isActive = true
    endTimeTextField.trailingAnchor.constraint(equalTo: dateTextField.trailingAnchor, constant: 0).isActive = true
    endTimeTextField.heightAnchor.constraint(equalTo: dateTextField.heightAnchor, multiplier: 1).isActive = true
    
    contentLabel.topAnchor.constraint(equalTo: endTimeTextField.bottomAnchor, constant: 16).isActive = true
    contentLabel.leadingAnchor.constraint(equalTo: dateTextField.leadingAnchor, constant: 0).isActive = true
    contentLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    contentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    contentTextField.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 8).isActive = true
    contentTextField.leadingAnchor.constraint(equalTo: dateTextField.leadingAnchor, constant: 0).isActive = true
    contentTextField.trailingAnchor.constraint(equalTo: dateTextField.trailingAnchor, constant: 0).isActive = true
    contentTextField.heightAnchor.constraint(greaterThanOrEqualToConstant: 36).isActive = true
    
    nameJobLabel.topAnchor.constraint(equalTo: contentTextField.bottomAnchor, constant: 16).isActive = true
    nameJobLabel.leadingAnchor.constraint(equalTo: dateTextField.leadingAnchor, constant: 0).isActive = true
    nameJobLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    nameJobLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    nameJobTextField.topAnchor.constraint(equalTo: nameJobLabel.bottomAnchor, constant: 8).isActive = true
    nameJobTextField.leadingAnchor.constraint(equalTo: dateTextField.leadingAnchor, constant: 0).isActive = true
    nameJobTextField.trailingAnchor.constraint(equalTo: dateTextField.trailingAnchor, constant: 0).isActive = true
    nameJobTextField.heightAnchor.constraint(equalTo: dateTextField.heightAnchor, multiplier: 1).isActive = true
    
    cancelButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 16).isActive = true
    cancelButton.leadingAnchor.constraint(equalTo: dateTextField.leadingAnchor, constant: 0).isActive = true
    cancelButton.trailingAnchor.constraint(equalTo: dateTextField.trailingAnchor, constant: 0).isActive = true
    cancelButton.heightAnchor.constraint(equalTo: dateTextField.heightAnchor, multiplier: 1).isActive = true
    cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32).isActive = true
    
    submitButton.topAnchor.constraint(greaterThanOrEqualTo: nameJobTextField.bottomAnchor, constant: 16).isActive = true
    submitButton.leadingAnchor.constraint(equalTo: dateTextField.leadingAnchor, constant: 0).isActive = true
    submitButton.trailingAnchor.constraint(equalTo: dateTextField.trailingAnchor, constant: 0).isActive = true
    submitButton.heightAnchor.constraint(equalTo: dateTextField.heightAnchor, multiplier: 1).isActive = true
  }
  
  func setupTextField() {
    dateTextField.delegate = self
    startTimeTextField.delegate = self
    endTimeTextField.delegate = self
    contentTextField.delegate = self
  }
}

extension NewJobViewController: UITextFieldDelegate {
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
